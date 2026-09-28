# Multi-Tier Architecture

## What is a Two-Tier Architecture?

A two-tier architecture is a system divided into two main parts: the application tier and the database tier. The application communicates with the database to process requests and store or retrieve information.

## The Web/Application Tier

The web/application tier is responsible for providing the user interface and handling HTTP requests. In this activity, Nextcloud serves as the web application that users access through a browser.

## The Database Tier

The database tier is responsible for storing persistent information. In this activity, MariaDB is used to store information needed by the Nextcloud application, such as user and file-related metadata.

## Why Separate Them?

Keeping the web application and database in separate containers makes the system more organized and easier to manage. Each container has a specific responsibility, so the application and database can be maintained or restarted separately instead of putting everything into one container.
