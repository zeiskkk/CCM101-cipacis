Linux Commands Used

The following terminal commands were executed during the resource assessment:

cat /etc/os-release – Identifies the operating system distribution and version details.

lscpu – Displays the server's CPU architecture and hardware specification.

free -h – Reports total, utilized, and available memory in human-readable units.

df -h – Outlines filesystem disk usage, capacity, and available storage space.

System Information

The analysis confirmed that the server runs Ubuntu 24.04.4 LTS (Noble Numbat) on an x86_64 architecture, equipped with 1 CPU core modeled as an Intel Xeon E312xx.
Regarding memory allocation, the system has 1.9 GiB of total RAM, with 448 MiB active, 802 MiB free, and 1.4 GiB available. For storage, the main root partition holds 19 GB total capacity, with 5.4 GB consumed (30% usage) and approximately 13 GB remaining.

Purpose of the Investigation

This activity demonstrated how to evaluate a Linux server's core resources via standard CLI tools rather than a graphical interface. Measuring processor, memory, and storage metrics provides essential baseline parameters for right-sizing cloud instances during infrastructure migration.

Terminal Output

Bash
cat /etc/os-release

The result showed:
Ubuntu 24.04.4 LTS (Noble Numbat)

CPU Information
The CPU was identified using:


lscpu


Important information from the output includes:
Architecture: x86_64
CPU(s): 1
Model name: Intel Xeon E312xx (Sandy Bridge, IBRS update)

Memory
Memory was checked using:


free -h


The result showed:
Total: 1.9Gi | Used: 448Mi | Free: 802Mi | Available: 1.4Gi

Disk Space
Disk space was checked using:


df -h


The result showed:
Total: 19G | Used: 5.4G | Available: 13G (30% used)
Cloud Migration Recommendation

To transition away from physical hardware, this system can be deployed onto major Infrastructure as a Service (IaaS) platforms:

AWS (Amazon EC2): Offers scalable Linux virtual instances, using the gathered CPU and RAM metrics to select an appropriately sized tier.

Google Cloud (Compute Engine): Allows flexible VM provisioning tailored to the exact resource footprint required by the application.

Microsoft Azure (Azure Virtual Machines): Supplies customizable Linux environments matching the existing compute and storage specs.

Recommended Cloud Service

Amazon EC2 is recommended for hosting this environment due to its extensive instance types suited for lightweight workloads (e.g., t3.micro). However, Google Compute Engine and Azure VM are equally viable options depending on organizational budget, network requirements, and performance criteria.

Migration Considerations

Prior to deployment, evaluate application dependencies, storage IOPS, network routing, and security configurations. Accounting for cloud usage costs, bandwidth transfer rates, and monitoring solutions early helps prevent configuration bottlenecks and unexpected expenses.

Summary: The target Linux server runs Ubuntu 24.04.4 LTS with 1 vCPU, 1.9 GiB RAM, and 19 GB disk storage. It can be smoothly provisioned into AWS EC2, GCP Compute Engine, or Azure VMs to maintain identical operational capabilities in a cloud environment.
