# Firewall Configuration

## 1. Allow SSH Access

Command:

```bash
sudo ufw allow ssh
```

Explanation: This rule allows incoming SSH connections, which are normally received on TCP port 22, so administrators can remotely manage the server.

## 2. Configure the Default Deny Policy

Commands:

```bash
sudo ufw default deny incoming
sudo ufw default allow outgoing
```

Explanation:

- `sudo ufw default deny incoming` blocks incoming connections unless a rule explicitly allows them.
- `sudo ufw default allow outgoing` permits outgoing connections initiated by the server by default.

## 3. Enable the Firewall

Command:

```bash
sudo ufw enable
```

Explanation: This activates the UFW firewall and applies its configured rules.

**Important:** If UFW is enabled before running `sudo ufw allow ssh`, incoming SSH connections may be blocked, potentially locking the administrator out of the server.

## 4. Verify the Firewall Status

Command:

```bash
sudo ufw status verbose
```

Explanation: This displays whether the firewall is active, its default policies, and its configured rules.

## 5. Allow the Web Application Port

Command:

```bash
sudo ufw allow 8080/tcp
```

Explanation: This adds a rule allowing incoming TCP traffic on port 8080 for the web application.

## 6. Verify the Numbered Firewall Rules

Command:

```bash
sudo ufw status numbered
```

Explanation: This lists the firewall rules with numbers so that the administrator can inspect the configured permissions.

## 7. Security Best Practices

- Allow only the network ports required by the server.
- Keep SSH access restricted to trusted administrators whenever possible.
- Use a Default Deny incoming policy.
- Avoid exposing databases and other sensitive services directly to the public internet.
- Review firewall rules regularly and remove unnecessary permissions.
- Verify the firewall status after changing its configuration.

## Conclusion

UFW provides a straightforward way to control incoming and outgoing network traffic on an Ubuntu server. Allowing SSH before enabling the firewall helps preserve remote administration access, while allowing TCP port 8080 provides a specific rule for the web application. These measures support the Principle of Least Privilege by limiting network access to required services.

