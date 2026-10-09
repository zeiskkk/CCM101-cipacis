# System Baseline Report

## Host System Baseline

| Metric | Value |
|--------|-------|
| Total RAM | 1.9 GiB |
| Total Storage (root `/`) | 19 GB |

### Detailed Memory Breakdown (from `free -h`)

| Field | Value |
|-------|-------|
| Total RAM | 1.9Gi |
| Used | 417Mi |
| Free | 1.2Gi |
| Shared | 1.1Mi |
| Buff/Cache | 458Mi |
| Available | 1.5Gi |
| Swap Total | 1.0Gi |

### Detailed Disk Breakdown (from `df -h /`)

| Field | Value |
|-------|-------|
| Filesystem | /dev/vda1 |
| Size | 19G |
| Used | 5.5G |
| Available | 13G |
| Use % | 30% |
| Mounted on | / |

### CPU Load (from `top`)

| Field | Value |
|-------|-------|
| Uptime | 46 min |
| Load Average | 0.00, 0.00, 0.00 |
| Total Tasks | 130 total, 1 running, 129 sleeping |
| %Cpu(s) | 0.0 us, 0.0 sy, 100.0 id, 0.0 wa |
| MiB Mem | 1903.2 total, 1094.9 free, 473.8 used, 500.1 buff/cache |
| MiB Swap | 1024.0 total, 1024.0 free, 0.0 used |

## Why Checking Disk Space Matters Before a Traffic Surge

Checking disk space is critical before a massive traffic surge because web servers write access logs, error logs, cache files, and session data to disk with every request; if the disk fills up, the application will crash, fail to write logs, or refuse new connections—causing an outage exactly when demand is highest. At 30% usage (5.5G of 19G), our server currently has 13G of free space, which provides ample headroom for a traffic spike.
