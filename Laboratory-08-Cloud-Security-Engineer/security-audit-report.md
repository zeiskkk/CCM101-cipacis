# Security Audit Report — Mission 8

## Core Security Concepts

### Principle of Least Privilege (PoLP)
The Principle of Least Privilege states that users, applications, and services should be granted only the minimum permissions necessary to perform their intended function. In cloud environments, this is critical because over-privileged accounts become high-value targets — a single compromised credential could allow an attacker to delete resources, access sensitive data, or incur massive costs.

### Attack Surface
The attack surface of a virtual machine is the sum of all possible entry points an attacker could exploit: open network ports, running services, user accounts, software vulnerabilities, and exposed APIs. Every unnecessary service or open port increases the attack surface. Reducing it is a core security practice.

### Default Deny Policy
A Default Deny policy means the firewall blocks all incoming traffic unless a specific rule explicitly permits it. This is safer than trying to block known attackers because you cannot predict every malicious IP or technique. By denying everything by default, you ensure that only intentional, audited services are reachable from the internet.
