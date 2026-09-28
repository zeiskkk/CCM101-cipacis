# Laboratory 06 - Cloud Deployment Engineer

## Mission Overview

In this laboratory activity, I deployed a multi-tier private cloud storage system using Nextcloud, MariaDB, Docker, and Docker Compose. The Nextcloud application and MariaDB database were deployed as separate containers and connected together using Docker Compose.

## Objectives

- Explain the concept of a multi-tier application architecture.
- Understand the purpose and structure of a docker-compose.yml file.
- Use the Linux command-line text editor nano to create configuration files.
- Deploy a multi-container application using Docker Compose.
- Document Infrastructure as Code (IaC) principles using Markdown.
- Continue expanding my GitHub Cloud Computing Portfolio.

## Commands Executed

```bash
mkdir nextcloud-deployment
cd nextcloud-deployment
nano docker-compose.yml
docker-compose up -d
docker-compose ps
docker-compose down
