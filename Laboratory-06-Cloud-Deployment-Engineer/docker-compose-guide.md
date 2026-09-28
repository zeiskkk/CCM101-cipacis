# Docker Compose Guide

## What Does the services: Block Do?

The `services:` block defines the containers that will be created and managed by Docker Compose. In this project, there are two services: the `database` service for MariaDB and the `app` service for Nextcloud.

## How Does the Nextcloud App Find the Database?

The Nextcloud application uses the `MYSQL_HOST` environment variable to find the database container.

The Compose file contains:

```yaml
- MYSQL_HOST=database
