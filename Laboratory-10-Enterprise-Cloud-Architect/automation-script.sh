#!/usr/bin/env bash
set -Eeuo pipefail
umask 077

PROJECT_DIR="$HOME/mission10"
BACKUP_DIR="$PROJECT_DIR/backups"
LOG_DIR="$PROJECT_DIR/logs"
LOG_FILE="$LOG_DIR/backup.log"
RETENTION_DAYS=7
COMMAND_TIMEOUT=180

cd "$PROJECT_DIR"
mkdir -p "$BACKUP_DIR" "$LOG_DIR"
chmod 700 "$BACKUP_DIR" "$LOG_DIR"
exec > >(tee -a "$LOG_FILE") 2>&1

timestamp="$(date +%Y%m%d_%H%M%S)"
work_dir="$(mktemp -d "$BACKUP_DIR/.backup_${timestamp}.XXXXXX")"
backup_file="$BACKUP_DIR/mission10_backup_${timestamp}.tar.gz"
maintenance_enabled=false

run_timeout() {
    timeout "$COMMAND_TIMEOUT" "$@"
}

nextcloud_occ() {
    run_timeout docker exec mission10-nextcloud \
        su -s /bin/sh www-data -c "php occ $*"
}

cleanup() {
    if [[ "$maintenance_enabled" == true ]]; then
        echo "[$(date -Is)] Disabling maintenance mode during cleanup..."
        docker exec mission10-nextcloud \
            su -s /bin/sh www-data -c 'php occ maintenance:mode --off' || true
    fi
    if [[ -d "${work_dir:-}" ]]; then
        rm -rf -- "$work_dir"
    fi
}
trap cleanup EXIT

echo "[$(date -Is)] Starting Mission 10 backup."

docker inspect -f '{{.State.Running}}' mission10-database | grep -qx true
docker inspect -f '{{.State.Running}}' mission10-nextcloud | grep -qx true

echo "[$(date -Is)] Checking Nextcloud installation..."
nextcloud_occ status

echo "[$(date -Is)] Enabling maintenance mode..."
nextcloud_occ maintenance:mode --on
maintenance_enabled=true

echo "[$(date -Is)] Dumping database..."
run_timeout docker exec mission10-database sh -c \
    'exec mariadb-dump --user=root --password="$MARIADB_ROOT_PASSWORD" --single-transaction --routines --events nextcloud' \
    > "$work_dir/nextcloud-database.sql"
test -s "$work_dir/nextcloud-database.sql"

echo "[$(date -Is)] Archiving Nextcloud files..."
run_timeout docker run --rm \
    --volumes-from mission10-nextcloud:ro \
    -v "$work_dir:/backup" \
    alpine:3.22 \
    sh -c 'tar -czf /backup/nextcloud-files.tar.gz -C /var/www/html .'

test -s "$work_dir/nextcloud-files.tar.gz"
tar -tzf "$work_dir/nextcloud-files.tar.gz" > /dev/null

echo "[$(date -Is)] Disabling maintenance mode..."
nextcloud_occ maintenance:mode --off
maintenance_enabled=false

echo "[$(date -Is)] Creating final backup archive..."
tar -czf "$backup_file" -C "$work_dir" .
test -s "$backup_file"
tar -tzf "$backup_file" > /dev/null

find "$BACKUP_DIR" -maxdepth 1 -type f \
    -name 'mission10_backup_*.tar.gz' \
    -mtime "+$RETENTION_DAYS" -delete

echo "[$(date -Is)] Backup completed: $backup_file"
ls -lh "$backup_file"
echo "[$(date -Is)] Backups older than $RETENTION_DAYS days are removed."
