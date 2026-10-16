# Laboratory 08 — Cloud Security Engineer

**Course:** CCM101 — Cloud Computing
**Mission:** Mission 8 — The Cloud Security Engineer
**Platform:** KillerCoda Ubuntu Playground
**Date:** [Insert Date]

---

## Mission Overview

A junior developer at CloudNova Technologies deployed a new Ubuntu server for a client's web application but forgot to configure network security, leaving the server completely exposed to the public internet. Acting as a Cloud Security Engineer, I secured the machine by establishing a baseline, deploying a host-based firewall (UFW) with a strict Default Deny policy, and selectively opening only the ports required by the client — SSH (22) for remote administration and Port 8080 for the web application.

---

## Objectives

At the end of this laboratory activity, I was able to:

1. Understand the concept of the **Attack Surface** and the **Principle of Least Privilege (PoLP)**.
2. Perform a basic security audit of active network ports on a Linux server.
3. Configure the **Uncomplicated Firewall (UFW)** with a **Default Deny** policy.
4. Implement granular port management to selectively allow **SSH** and **HTTP (8080)** traffic.
5. Document firewall rules and security best practices using Markdown.
6. Continue expanding my professional GitHub Cloud Computing Portfolio.

---

## Commands Executed

### Checkpoint 3 — Deploy the Vulnerable Application

```bash
# Install Docker (if not present)
sudo apt update && sudo apt install -y docker.io
sudo systemctl start docker

# Run Nginx web server container on port 8080
docker run -d --name secure-web-app -p 8080:80 nginx

# Verify the container is running
docker ps

# Simulate a user request
curl http://localhost:8080
