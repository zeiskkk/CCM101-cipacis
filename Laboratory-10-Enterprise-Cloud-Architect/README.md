
# Mission 10: The Enterprise Cloud Architect

## Mission Overview

For this mission, I designed and deployed a small enterprise cloud environment using Ubuntu Server, Docker, and Nextcloud. The project demonstrates how different cloud infrastructure components work together to provide application hosting, database storage, network connectivity, security, and automated backups.

The environment runs inside an Ubuntu Server virtual machine using Oracle VirtualBox. Docker Compose manages the Nextcloud and MariaDB containers.

## Objectives

- Set up and configure an Ubuntu Server virtual machine.
- Install and configure Docker and Docker Compose.
- Deploy Nextcloud with a MariaDB database.
- Configure Docker networks and persistent storage.
- Apply basic firewall rules using UFW.
- Configure SSH access and VirtualBox port forwarding.
- Create an automated backup script.
- Schedule daily backups using cron.
- Document the infrastructure, deployment, and security configuration.

## Required Resources

- Oracle VirtualBox
- Ubuntu Server 24.04
- Docker Engine
- Docker Compose
- Nextcloud
- MariaDB
- UFW Firewall
- Windows Terminal or SSH client
- GitHub repository

## Infrastructure Architecture

The following diagram shows the main components and how they communicate with each other.



## Deployed Services

| Component | Description |
|---|---|
| Ubuntu Server | Main operating system |
| Docker Engine | Runs the application containers |
| Docker Compose | Manages the deployment |
| Nextcloud | Cloud file storage application |
| MariaDB | Nextcloud database |
| UFW | Host firewall |
| Cron | Schedules automated backups |

## Accessing Nextcloud

Nextcloud is accessible through the host machine's browser using:

```text
http://127.0.0.1:8080
```

SSH access from Windows Terminal uses:

```bash
ssh -p 2222 cloudnova@127.0.0.1
```

These connections use VirtualBox NAT port forwarding.

## Network and Security Configuration

The Ubuntu Server firewall is configured with UFW.

- Default incoming traffic: Denied
- Default outgoing traffic: Allowed
- SSH: Port 22 allowed
- Nextcloud: Port 8080 allowed

VirtualBox port forwarding is configured for SSH and Nextcloud using the host loopback address `127.0.0.1`.

Docker publishes the Nextcloud service on the guest's network interfaces. UFW rules alone should not be treated as protection for Docker-published ports.

## Persistent Storage

Docker named volumes are used to preserve application and database data:

- `mission10_nextcloud_data`
- `mission10_db_data`

These volumes allow data to remain available even if the containers are recreated.

## Backup Automation

The project includes an executable backup script:

```text
automation-script.sh
```

The script performs the following tasks:

1. Checks the Nextcloud and database containers.
2. Enables Nextcloud maintenance mode.
3. Creates a MariaDB database dump.
4. Archives Nextcloud files.
5. Disables maintenance mode.
6. Creates and verifies the final compressed backup.
7. Removes backups older than seven days.

A cron job is configured to run the script daily at **2:00 AM UTC**.

The scheduled execution should be verified through the cron log while the virtual machine is running.

## Verification Commands

Check the running containers:

```bash
docker compose ps
```

Check Docker:

```bash
docker --version
docker compose version
```

Check firewall status:

```bash
sudo ufw status verbose
```

Check the backup log:

```bash
tail -n 30 ~/mission10/logs/backup.log
```

Check the cron schedule:

```bash
crontab -l
```

## Skills Learned

Through this mission, I gained practical experience in Linux server administration, virtualization, Docker containerization, cloud application deployment, database management, network configuration, firewall security, and backup automation.

This project helped me understand how different infrastructure components work together to create and maintain a functional cloud environment.
