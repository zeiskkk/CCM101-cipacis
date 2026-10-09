# Mission Reflection

## 1. Why is it important to check the host server's resources even if your containers are running perfectly?

Containers share the host's kernel and physical resources, so a container that appears healthy can still be starved if the host itself is overloaded. Checking the host's CPU, memory, and disk ensures there is enough headroom for scaling, prevents noisy-neighbor problems, and catches issues like disk-full conditions or memory pressure that would eventually crash even well-behaved containers. The host is the foundation—if it fails, every container on it fails with it.

## 2. If a user complains that they cannot log into a web application, how would the `docker logs` command help you solve the problem?

`docker logs <container>` would show the incoming request, the application's response code, and any error messages or stack traces generated during the login attempt. For example, a `401 Unauthorized` might indicate bad credentials, a `500 Internal Server Error` might point to a database connection failure, and a missing log entry might suggest the request never reached the app. This lets me pinpoint whether the issue is in the app, the network, or the user's input.

## 3. What is the difference between monitoring logs (Checkpoint 4) and monitoring metrics (Checkpoint 5)?

Logs are discrete, timestamped text records of specific events—they tell you *what happened* and *why* (e.g., "GET /hidden-admin-page returned 404"). Metrics are numerical time-series data—they tell you *how much* and *how fast* (e.g., CPU 0.00%, memory 2.734 MiB). Logs are for diagnosis and forensics; metrics are for trend analysis, alerting, and capacity planning. Both are needed for full observability.

## 4. How do you think large enterprise companies monitor thousands of containers at the same time?

They use centralized observability platforms like **Prometheus** for metrics collection and **Grafana** for visualization, often combined with log aggregators like the ELK stack (Elasticsearch, Logstash, Kibana) or Loki. Container orchestrators like Kubernetes expose metrics endpoints that Prometheus scrapes automatically, and Grafana dashboards display them in real time. Alertmanager then routes alerts to on-call engineers when thresholds are breached. This scales horizontally and gives a single pane of glass across the entire fleet.

## 5. How has your ability to troubleshoot Linux environments improved?

I now know how to quickly baseline a system with `free`, `df`, and `top`, deploy and inspect containers with `docker run`, `logs`, and `stats`, and generate controlled test traffic with `curl`. More importantly, I've learned to think like an SRE: prove health with data rather than assume it, and use logs and metrics together to move from "something is wrong" to "here is exactly what is wrong and why."
