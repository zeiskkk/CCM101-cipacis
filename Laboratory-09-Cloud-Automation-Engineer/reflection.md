
---

## Checkpoint 7 — Mission Reflection

Open `reflection.md` and write **250–350 words** (strictly). Here's a version that fits the limit:

```markdown

---

## 1. Why is automation critical when managing hundreds of cloud servers?

At scale, manual administration becomes impossible — a task that takes 30 seconds on one server would take over 8 hours on a thousand, and human error compounds with repetition. Automation ensures consistency, repeatability, and speed. It also enables operations to happen outside business hours, like the 2:00 AM backup in this mission, without requiring anyone to be awake.

## 2. What are the potential dangers of automation?

Automation amplifies whatever you tell it to do — including mistakes. A destructive typo in a script scheduled to run on 1,000 servers (e.g., `rm -rf /` instead of `rm -rf /tmp/old/`) could wipe out an entire fleet in seconds, with no chance for a human to intervene. This is why scripts should be tested in a staging environment, reviewed by peers, and version-controlled before deployment.

## 3. How did writing a Bash script differ from creating a Docker Compose YAML file?

Docker Compose is **declarative** — I describe the desired end state and Docker figures out how to achieve it. Bash scripting is **imperative** — I specify each step the machine must execute in order. YAML is structured and validated; Bash is more flexible but unforgiving of typos. Both are forms of automation, but they operate at different layers: Compose manages containers, Bash manages the operating system.

## 4. How has your understanding of Cloud Computing transformed over the semester?

At the start, "cloud" meant storage and remote servers. Over nine missions, I've built infrastructure, deployed containerized applications, worked with data pipelines, secured a server with UFW, and now automated operations with Cron. I now understand cloud computing as a layered discipline — networking, compute, storage, security, automation — where each layer depends on the others. Most importantly, I've learned that cloud engineering is as much about **process and discipline** as it is about technology.

## 5. Which role did you enjoy the most and why?

The **Security Engineer** role (Mission 8) stood out because it required adversarial thinking — imagining how an attacker would approach the server, then closing those doors one by one. But the **Automation Engineer** role was the most satisfying, because writing a script that runs silently every night felt like teaching the machine to take care of itself.
