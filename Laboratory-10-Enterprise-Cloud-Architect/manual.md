# Mission 10: Enterprise Cloud Architect
# Operational Manual

## 1. Project Overview

This project uses Ubuntu Server 24.04 as the main operating system for a private cloud environment. It runs Nextcloud and MariaDB using Docker Compose.

The deployment is hosted inside an Oracle VirtualBox virtual machine and can be accessed from the Windows host through SSH and a web browser.

## 2. System Requirements and Configuration

| Component | Configuration |
|---|---|
| Host Operating System | Windows |
| Virtualization Software | Oracle VirtualBox |
| Virtual Machine OS | Ubuntu Server 24.04 |
| Hostname | cloud |
| Username | cloudnova |
| Docker Engine | 29.1.3 |
| Docker Compose | 2.40.3 |
| Cloud Application | Nextcloud |
| Database | MariaDB 11.4 |
| Web Access | http://127.0.0.1:8080 |
| SSH Access | 127.0.0.1:2222 |
| Firewall | UFW |

## 3. Network and Access Configuration

The Ubuntu Server virtual machine uses NAT networking in VirtualBox.

The following port forwarding rules are configured:

| Service | Host IP | Host Port | Guest Port |
|---|---|---:|---:|
| SSH | 127.0.0.1 | 2222 | 22 |
| Nextcloud | 127.0.0.1 | 8080 | 8080 |

### Accessing Ubuntu Server through SSH

Open Windows Terminal and execute:

```bash
ssh -p 2222 cloudnova@127.0.0.1
```

### Accessing Nextcloud

Open a web browser on the Windows host and visit:

```text
http://127.0.0.1:8080
```

Log in using the Nextcloud administrator account created during installation.

## 4. Docker Deployment Management

The project files are stored in:

```text
/home/cloudnova/mission10/
```

Navigate to the project directory:

```bash
cd ~/mission10
```

### Check running containers

```bash
docker compose ps
```

### Start the deployment

```bash
docker compose up -d
```

### Stop the deployment

```bash
docker compose stop
```

### Restart the deployment

```bash
docker compose restart
```

### View container logs

```bash
docker compose logs
```

To view the Nextcloud logs:

```bash
docker compose logs nextcloud
```

To view the database logs:

```bash
docker compose logs database
```

### Check Docker versions

```bash
docker --version
docker compose version
```

## 5. Persistent Storage

The deployment uses Docker named volumes to preserve application and database data.

| Volume | Purpose |
|---|---|
| mission10_nextcloud_data | Stores Nextcloud application and user data |
| mission10_db_data | Stores MariaDB database files |

To list the available volumes:

```bash
docker volume ls
```

Do not remove these volumes when stopping or restarting the application. Removing them can result in data loss.

## 6. Firewall Configuration

UFW is enabled to manage incoming and outgoing network traffic.

The configured default policies are:

- Deny incoming connections.
- Allow outgoing connections.
- Deny routed connections.

The allowed rules include:

| Port | Purpose |
|---|---|
| 22/tcp | SSH access |
| 8080/tcp | Nextcloud web access |

Check the firewall status:

```bash
sudo ufw status verbose
```

Display numbered firewall rules:

```bash
sudo ufw status numbered
```

**Security note:** Docker-published ports can bypass ordinary UFW filtering. The Nextcloud container currently publishes port 8080 on all VM interfaces, while VirtualBox's host forwarding is bound to 127.0.0.1. Do not assume that the UFW rules alone restrict Docker-published traffic.

## 7. Backup and Automation

A custom Bash script is used to back up the Nextcloud database and application files.

Script location:

```text
/home/cloudnova/mission10/automation-script.sh
```

Backup directory:

```text
/home/cloudnova/mission10/backups/
```

Log directory:

```text
/home/cloudnova/mission10/logs/
```

### Run a manual backup

```bash
~/mission10/automation-script.sh
```

The script performs these operations:

1. Checks whether the Nextcloud and MariaDB containers are running.
2. Checks the Nextcloud installation status.
3. Enables Nextcloud maintenance mode.
4. Creates a MariaDB database dump.
5. Archives the Nextcloud files.
6. Disables maintenance mode.
7. Combines the backup files into one compressed archive.
8. Verifies the archive.
9. Removes old backup archives after the configured retention period of seven days.

### Check available backups

```bash
ls -lh ~/mission10/backups/
```

### Check the backup log

```bash
tail -n 30 ~/mission10/logs/backup.log
```

### Automated backup schedule

The backup is scheduled through cron:

```cron
0 2 * * * /home/cloudnova/mission10/automation-script.sh >> /home/cloudnova/mission10/logs/cron.log 2>&1
```

This runs daily at 2:00 AM UTC, equivalent to 10:00 AM Philippine time.

Check the cron schedule:

```bash
crontab -l
```

Check the cron service:

```bash
systemctl is-active cron
```

The virtual machine must be running at the scheduled time for the job to execute.

### Verify a backup archive

Replace the example filename with the actual backup filename:

```bash
tar -tzf ~/mission10/backups/mission10_backup_YYYYMMDD_HHMMSS.tar.gz
```

A valid archive should contain:

```text
./
./nextcloud-files.tar.gz
./nextcloud-database.sql
```

## 8. Backup Recovery Overview

The backup archive contains two important components:

- `nextcloud-database.sql` — database backup.
- `nextcloud-files.tar.gz` — Nextcloud file archive.

For recovery, preserve the current data before making changes. Stop or place the application into maintenance mode, restore the database dump into MariaDB, restore the Nextcloud files into the appropriate persistent volume, check ownership and permissions, and verify the installation.

A restore should be performed using a compatible Nextcloud version and database configuration. Do not overwrite the existing volumes until the backup has been checked and a recovery plan is ready.

The recovery process should be tested separately before relying on it for production data.

## 9. Security Practices

The following security practices are used in this project:

- Keep database passwords in the `.env` file.
- Restrict `.env` permissions to the owner using `chmod 600`.
- Restrict the backup script using `chmod 700`.
- Do not upload `.env`, actual passwords, or backup archives to GitHub.
- Use VirtualBox NAT with host forwarding bound to 127.0.0.1.
- Keep Ubuntu Server and Docker updated.
- Review firewall rules and Docker port exposure.
- Protect the Ubuntu account because membership in the Docker group grants root-equivalent privileges.

## 10. Troubleshooting

### Nextcloud is not accessible

Check the containers:

```bash
docker compose ps
```

Check Nextcloud logs:

```bash
docker compose logs nextcloud
```

Check whether the web service responds:

```bash
curl -I http://localhost:8080
```

### MariaDB is not healthy

Check the database logs:

```bash
docker compose logs database
```

### Backup script does not run

Check the script permissions:

```bash
ls -l ~/mission10/automation-script.sh
```

Check the cron schedule:

```bash
crontab -l
```

Check the cron service:

```bash
systemctl is-active cron
```

Review the cron log:

```bash
tail -n 30 ~/mission10/logs/cron.log
```

## 11. Conclusion

This manual provides the basic procedures for operating and maintaining the Mission 10 cloud deployment. It covers application access, container management, persistent storage, firewall configuration, backup automation, and troubleshooting.
