# Security Audit Report

## 1. Principle of Least Privilege (PoLP)

The Principle of Least Privilege means that every user or application should only have the permissions needed to perform its assigned tasks. It is important in cloud computing because limiting access reduces the possibility of unauthorized actions, accidental damage, and data breaches if an account becomes compromised.

## 2. Attack Surface

The attack surface refers to all the possible entry points that an attacker could use to access or exploit a virtual machine. These include open network ports, running services, applications, and exposed access points. Reducing unnecessary services and restricting network traffic can help minimize these risks.

## 3. Default Deny Policy

A Default Deny policy means that incoming network traffic is blocked unless a specific firewall rule allows it. This approach is safer than blocking individual attackers because it prevents unauthorized connections by default, including connections from attackers whose identities are unknown.

## 4. Server Security Audit

The purpose of this audit is to identify active network services and configure firewall rules that allow only the traffic required by the server.

The server was prepared to run an Nginx web application through Docker using port 8080. The application was tested with the `curl` command before configuring the firewall.

### Commands Used for Inspection

```bash
sudo ss -tulnp
sudo ufw status verbose
```

- `ss -tulnp` displays listening TCP and UDP ports and associated processes where permissions allow.
- `ufw status verbose` displays the firewall status, default policies, and configured rules.

### Security Findings

The server requires SSH access on port 22 for remote administration and TCP port 8080 for the web application. Other incoming traffic should be denied unless it is specifically required.

The firewall configuration applies the Default Deny incoming policy and explicitly allows the required services. This helps reduce the server's attack surface and limits unnecessary network access.

### Conclusion

This audit demonstrates the importance of identifying exposed services before securing a cloud server. By using UFW and allowing only required incoming connections, the server can follow a more restrictive security policy. The actual listening ports and firewall status should be verified in the terminal and documented using screenshots.
