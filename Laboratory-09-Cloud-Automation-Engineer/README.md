
### Part B: Update `README.md`

```markdown
# Laboratory 09 — Cloud Automation Engineer

## Mission Overview

Acting as a Cloud Automation Engineer at CloudNova Technologies, I eliminated a manual backup process that had previously caused permanent data loss due to human error. I wrote a Bash script that compresses the client's application directory into a timestamped `.tar.gz` archive, made it executable with `chmod`, and scheduled it to run automatically every night at 2:00 AM using the Linux Cron scheduler.

## Objectives

- Understand the fundamental syntax of a Bash shell script, including variables and basic commands
- Use a command-line text editor (`nano`) to write and save executable scripts
- Modify Linux file permissions using the `chmod` command
- Understand task scheduling and the syntax of a Linux crontab
- Document automation code and Cron job configurations using Markdown
- Complete the final chapter of the GitHub Cloud Computing Portfolio

## Commands Executed

```bash
# Create dummy application data
mkdir app-data
echo "This is critical client data." > app-data/data.txt

# Write the backup script
nano backup.sh

# Attempt to run (fails with Permission denied)
./backup.sh

# Make executable
chmod +x backup.sh

# Run successfully
./backup.sh

# Verify the backup was created
ls -l backups/

# Check existing cron jobs
crontab -l

# Edit the cron table
env EDITOR=nano crontab -e
# Added line: 0 2 * * * /root/backup.sh

# Verify the schedule
crontab -l
