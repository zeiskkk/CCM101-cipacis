# Automation Research — Mission 9

---

## Purpose

Before writing any automation code, this report establishes the theoretical foundation for the tools used in this mission: Bash scripting and the Linux Cron scheduler. Each concept is defined in my own words.

---

## 1. Bash Script

A **Bash script** is a plain-text file containing a sequence of shell commands that Linux executes in order, one after another, exactly as if a user had typed them into the terminal. It allows you to bundle multiple operations — creating directories, copying files, compressing data, printing status messages — into a single reusable program that can be run with one command or scheduled to run automatically. Bash scripts are the fundamental building block of Linux automation and are used everywhere from startup routines to cloud deployment pipelines.

The `#!/bin/bash` line at the very top of a script is called a **shebang** (a contraction of "sharp" and "bang," the two characters it contains: `#` and `!`). The shebang tells the operating system which interpreter to use when executing the file. Without it, Linux might not know whether the file is a Bash script, a Python program, or a Perl script — the shebang removes that ambiguity. When you run `./backup.sh`, the kernel reads the first line, sees `#!/bin/bash`, and hands the file to the Bash interpreter for execution.

---

## 2. Variables

**Variables** are named containers that store values — such as a folder path, a filename, a number, or the output of a command — so that the value can be referenced multiple times without retyping it. In a Bash script, a variable is assigned with the syntax `VARIABLE_NAME="value"` and referenced later with a `$` prefix, like `$VARIABLE_NAME`.

Programmers use variables like `$SOURCE_DIR` or `$BACKUP_DIR` instead of typing out the literal folder path every time for several reasons. First, **maintainability**: if the folder name ever changes, you only update one line at the top of the script instead of hunting down every occurrence. Second, **readability**: a well-named variable like `$BACKUP_DIR` is self-documenting and makes the script easier for others (or your future self) to understand. Third, **dynamic values**: variables can hold the output of commands, such as `TIMESTAMP=$(date +"%Y-%m-%d")`, which produces a different value every time the script runs — essential for creating uniquely named backup files.

---

## 3. Cron Job

A **cron job** is a scheduled task in Linux that runs automatically at a specified interval — every minute, hour, day, week, or month — without any human intervention. The scheduling rules are defined in a file called a **crontab** (cron table), which uses a five-field syntax to specify the exact timing: minute, hour, day of month, month, and day of week. The Linux `cron` daemon reads this file and executes the associated commands at the appropriate times.

Cron jobs are **essential for cloud operations** because many critical maintenance tasks must happen reliably on a schedule, regardless of whether anyone is awake or available to run them manually. Backups, log rotation, security patch installation, certificate renewals, health checks, and cost-optimization scripts are all commonly automated with Cron. In a cloud environment with hundreds or thousands of servers, manual execution of these tasks is not just impractical — it is impossible. Cron eliminates human error, ensures consistency across a fleet, and enables operations to run 24/7 without staffing. As the mission brief states: *"If you have to do a task more than twice in the cloud, you should automate it."*

---

## Summary Table

| Concept | Definition | Why It Matters in Cloud |
|---|---|---|
| **Bash Script** | A text file of shell commands executed in sequence; begins with `#!/bin/bash` (shebang) | Automates repetitive system administration tasks |
| **Variables** | Named containers for values, referenced with `$`; improve maintainability and enable dynamic values | Reduce errors and make scripts reusable across environments |
| **Cron Job** | A scheduled task defined in a crontab using 5 time fields; runs automatically | Enables 24/7 operations without human intervention |

---

## Key Takeaway

Automation is what separates a small-scale hobbyist setup from a production cloud environment. Bash scripts provide the *what* (the actions to perform), variables provide the *flexibility* (adapting to changing paths and timestamps), and Cron provides the *when* (running reliably on schedule). Together, these three tools form the foundation of cloud operations at scale.
