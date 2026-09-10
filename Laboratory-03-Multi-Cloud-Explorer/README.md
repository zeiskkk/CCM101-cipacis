# Linux Server Assessment and Cloud Migration Strategy

This repository documents the resource investigation of a Linux server performed in the **KillerCoda Playground**, along with cloud migration recommendations based on the collected hardware and system metrics.

## Overview

Terminal commands were used to assess the server's core system parameters, including the operating system, CPU architecture, memory allocation, and disk space usage.

### Server Resource Summary

| Resource         | Specification / Status                                          |
| ---------------- | --------------------------------------------------------------- |
| **OS**           | Ubuntu 24.04.4 LTS (Noble Numbat)                               |
| **CPU**          | 1 vCPU (x86_64, Intel Xeon E312xx @ 2.0 GHz)                    |
| **Memory (RAM)** | 1.9 GiB Total (448 MiB Used / 802 MiB Free / 1.4 GiB Available) |
| **Disk Storage** | 19 GB Total (5.4 GB Used / 13 GB Available / 30% Used)          |

## Linux Commands Used

The following Linux commands were used to investigate the server's resources:

| Command               | Purpose                                                        |
| --------------------- | -------------------------------------------------------------- |
| `cat /etc/os-release` | Identifies the operating system distribution and version.      |
| `lscpu`               | Displays CPU architecture and hardware information.            |
| `free -h`             | Reports memory usage in a human-readable format.               |
| `df -h`               | Displays filesystem capacity, usage, and available disk space. |

## Captured Terminal Logs

### Operating System

```bash
root@ubuntu:~# cat /etc/os-release
PRETTY_NAME="Ubuntu 24.04.4 LTS"
NAME="Ubuntu"
VERSION_ID="24.04"
VERSION="24.04.4 LTS (Noble Numbat)"
```

### CPU Information

```bash
root@ubuntu:~# lscpu
Architecture:             x86_64
CPU(s):                   1
Model name:               Intel Xeon E312xx (Sandy Bridge, IBRS update)
```

### Memory Information

```bash
root@ubuntu:~# free -h
              total        used        free      shared  buff/cache   available
Mem:          1.9Gi       448Mi       802Mi       1.1Mi       820Mi       1.4Gi
```

### Disk Information

```bash
root@ubuntu:~# df -h
Filesystem      Size  Used Avail Use% Mounted on
/dev/vda1        19G  5.4G   13G  30% /
```

## Cloud Migration Recommendations

Based on the server's resource usage, the workload requires relatively low computing resources. It can be migrated to a lightweight virtual machine offered by a major cloud provider.

### AWS – Amazon EC2

**Amazon EC2** is a suitable option for hosting the workload using a small instance type such as **t3.micro** or **t4g.micro**, depending on application compatibility and availability.

### Google Cloud – Compute Engine

**Google Cloud Compute Engine** provides flexible virtual machine configurations. A small VM can be selected to closely match the server's current CPU and memory requirements.

### Microsoft Azure – Virtual Machines

**Microsoft Azure Virtual Machines** provides lightweight VM options, such as **B-series instances**, that are suitable for small-scale applications and workloads with low or variable CPU usage.

## Migration Considerations

### 1. Right-Sizing

The current workload requires minimal computing resources:

* **CPU:** 1 vCPU
* **RAM:** Less than 2 GB
* **Disk:** Approximately 19 GB

A small cloud instance should therefore be sufficient for the initial migration. Resource usage should be monitored after deployment to determine whether scaling is necessary.

### 2. Security and Networking

Before migration, appropriate security and networking configurations should be established. This includes:

* Configuring firewall rules
* Defining required inbound and outbound traffic
* Restricting unnecessary ports
* Using secure authentication methods
* Applying regular operating system updates

### 3. Cost Control

Cloud resources should be monitored to prevent unnecessary expenses. Monitoring and billing tools can help track:

* CPU and memory utilization
* Storage usage
* Network traffic
* Idle resources
* Data transfer and egress costs

## Conclusion

The Linux server investigated in the KillerCoda Playground has relatively modest resource requirements, with **1 vCPU, 1.9 GiB of RAM, and 19 GB of disk storage**. Based on these measurements, the workload can be migrated to a lightweight cloud virtual machine.

AWS EC2, Google Cloud Compute Engine, and Microsoft Azure Virtual Machines are all potential platforms. The final choice should depend on factors such as pricing, availability, application compatibility, security requirements, and future scalability.
