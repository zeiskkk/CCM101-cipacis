# Laboratory 07 - Cloud Operations Engineer

## Mission Overview

In this mission, I stepped into the role of a Cloud Operations Engineer (Site Reliability Engineer) at CloudNova Technologies. Using the KillerCoda Playground, I established a performance baseline for a Linux server, deployed a containerized Nginx web application, generated artificial web traffic, and hunted down performance metrics and system logs to prove the application is healthy. Remember: a developer hopes the application works; an SRE uses metrics and logs to prove it.

## Objectives

- Utilize native Linux command-line tools to monitor host CPU, Memory, and Disk capacity.
- Deploy a web container and track its real-time performance using Docker metrics.
- Generate web traffic and extract application access logs for analysis.
- Translate raw performance data into a readable technical report using Markdown.
- Continue expanding a professional GitHub Cloud Computing Portfolio.

## Monitoring Commands Executed

| Command | Purpose |
|---------|---------|
| `free -h` | Check total and available RAM |
| `df -h /` | Check root filesystem disk capacity |
| `top` | View active processes and CPU load |
| `docker run -d --name client-website2 -p 8080:80 nginx` | Deploy Nginx container in background |
| `curl http://localhost:8080` | Generate successful HTTP traffic (HTTP 200) |
| `curl http://localhost:8080/hidden-admin-page` | Generate a 404 error |
| `docker logs client-website2` | Retrieve application access logs |
| `docker stats` | View real-time container resource metrics |

## Skills Learned

- Establishing a host system baseline using native Linux CLI tools (`free`, `df`, `top`)
- Deploying and managing Docker containers in detached mode
- Simulating web traffic and intentionally triggering HTTP errors with `curl`
- Extracting and analyzing containerized application logs to find specific error codes
- Interpreting real-time container metrics (`docker stats`) for resource efficiency
- Documenting observability data accurately using Markdown
- Maintaining a well-structured, professional GitHub portfolio

## Evidence

All screenshots are stored in the `screenshots/` folder:

| File | Description |
|------|-------------|
| `memory-check.png` | `free -h` output showing 1.9Gi total RAM |
| `disk-check.png` | `df -h /` output showing 19G root filesystem |
| `install-nginx.png` | Nginx container deployed and running |
| `simulation1.png` | Successful HTTP 200 responses via curl |
| `simulation2.png` | 404 Not Found response for hidden-admin-page |
| `docker-logs.png` | Container logs showing 200 and 404 entries |
| `container-metrics.png` | `docker stats` output for client-website2 |
