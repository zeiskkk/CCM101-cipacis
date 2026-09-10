# Laboratory 03 – Multi-Cloud Explorer

This laboratory activity explores and compares Amazon Web Services (AWS), Microsoft Azure, and Google Cloud Platform (GCP).

## Mission Objectives

- Explore major public cloud platforms.
- Identify core services offered by AWS, Azure, and GCP.
- Compare cloud services across different providers.
- Analyze business requirements and recommend appropriate cloud solutions.
- Continue developing the GitHub Cloud Computing Portfolio.

---

# Checkpoint 7 – Linux Investigation

## Linux Server Information

The Linux server was investigated using a KillerCoda Playground.

### Operating System

The operating system was identified using:


```bash
Operating System
cat /etc/os-release
The result showed:
Ubuntu 24.04.4 LTS (Noble Numbat)

CPU Information
The CPU was identified using: lscpu

Important information from the output includes:
Architecture: x86_64
CPU(s): 1
Model name: Intel Xeon E312xx (Sandy Bridge, IBRS update)

Memory was checked using:
free -h
The result showed:
Total: 1.9Gi | Used: 448Mi | Free: 802Mi | Available: 1.4Gi

Disk Space
Disk space was checked using:
df -h
The result showed:
Total: 19G | Used: 5.4G | Available: 13G (30% used)
