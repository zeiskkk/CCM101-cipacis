Linux Server Assessment and Cloud Migration StrategyThis repository documents the resource investigation of a Linux server executed in the KillerCoda Playground, along with cloud migration recommendations based on the gathered hardware metrics.OverviewTerminal commands were used to assess core system parameters, including operating system release, CPU architecture, memory allocation, and disk space usage.+------------------+-------------------------------------------------------+
| Resource         | Specification / Status                                |
+------------------+-------------------------------------------------------+
| OS               | Ubuntu 24.04.4 LTS (Noble Numbat)                     |
| CPU              | 1 vCPU (x86_64, Intel Xeon E312xx @ 2.0GHz)           |
| Memory (RAM)     | 1.9 GiB Total (448 MiB Used / 802 MiB Free / 1.4Gi Avail) |
| Disk Storage     | 19 GB Total (5.4 GB Used / 13 GB Avail / 30% Used)    |
+------------------+-------------------------------------------------------+
Linux Commands Usedcat /etc/os-release – Identifies the OS distribution and version details.lscpu – Displays the server's CPU architecture and hardware details.free -h – Reports total, utilized, and available memory in human-readable units.df -h – Outlines filesystem usage, capacity, and available disk space.Captured Terminal LogsBashroot@ubuntu:~# cat /etc/os-release
PRETTY_NAME="Ubuntu 24.04.4 LTS"
NAME="Ubuntu"
VERSION_ID="24.04"
VERSION="24.04.4 LTS (Noble Numbat)"

root@ubuntu:~# lscpu
Architecture:             x86_64
CPU(s):                   1
Model name:               Intel Xeon E312xx (Sandy Bridge, IBRS update)

root@ubuntu:~# free -h
              total        used        free      shared  buff/cache   available
Mem:          1.9Gi       448Mi       802Mi       1.1Mi       820Mi       1.4Gi

root@ubuntu:~# df -h
Filesystem      Size  Used Avail Use% Mounted on
/dev/vda1        19G  5.4G   13G  30% /
Cloud Migration RecommendationsTransitioning this workload away from a physical or playground environment can be achieved using major cloud providers:AWS (Amazon EC2): Recommended platform using an entry-level instance (e.g., t3.micro or t4g.micro) to host the workload cost-effectively.Google Cloud (Compute Engine): Provides custom VM sizing to match the exact memory and core requirements.Microsoft Azure (Azure VMs): Offers equivalent lightweight B-series instances ideal for small scale applications.Migration ConsiderationsRight-Sizing: The workload requires minimal compute power ($\le 1\text{ vCPU}, < 2\text{ GB RAM}$).Security & Networking: Define essential Security Group ingress/egress rules before cutover.Cost Control: Utilize cloud monitoring tools to avoid unexpected charges for idle resources or data egress.
