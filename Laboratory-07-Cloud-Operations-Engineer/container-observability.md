# Container Observability

## Application Logs (Checkpoint 4)

### The 404 Error Log Line

2026/10/09 01:34:24 [error] 29#29: *3 open() "/usr/share/nginx/html/hidden-admin-page" failed (2: No such file or directory), client: 172.17.0.1, server: localhost, request: "GET /hidden-admin-page HTTP/1.1", host: "localhost:8080"

And the corresponding access log line:

172.17.0.1 - - [09/Oct/2026:01:34:24 +0000] "GET /hidden-admin-page HTTP/1.1" 404 153 "-" "curl/8.5.0"

### Why Application Logs Are Vital for Troubleshooting

Application logs are vital for troubleshooting because they provide a timestamped, line-by-line record of every request, error, and system event—allowing engineers to trace exactly what happened, when it happened, and which client triggered it. Without logs, diagnosing issues such as a broken endpoint or failed authentication would be pure guesswork, since the container's internal state is invisible from the outside.

---

## Real-Time Container Metrics (Checkpoint 5)

### Docker Stats Output

| Metric | Value at Time of Screenshot |
|--------|----------------------------|
| Container ID | db8638bdabeb |
| Container Name | client-website2 |
| CPU % | 0.00% |
| Memory Usage | 2.734MiB / 1.859GiB |
| Memory % | 0.14% |
| Network I/O | 3.29kB / 3.82kB |
| Block I/O | 0B / 12.3kB |
| PIDs | 2 |

### Analysis

The `client-website2` Nginx container was consuming approximately **2.734 MiB** of memory (just **0.14%** of the available 1.859 GiB limit) and **0.00% CPU** at the time of the screenshot. This confirms the container is highly efficient and poses no risk of exhausting the host's resources during a traffic surge.
