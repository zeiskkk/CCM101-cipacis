# Laboratory 04 - The Cloud-Native Engineer

## Mission Overview

This laboratory activity focuses on cloud-native technologies, particularly containers and Docker. The activity started with comparing Virtual Machines and containers to understand their differences. Using the KillerCoda Playground, Docker commands were then used to pull and run an Nginx web server inside a container. The container was also tested, stopped, and removed to practice its basic lifecycle.

## Objectives

* Differentiate between traditional Virtual Machines and containers.
* Access a Docker-enabled cloud environment using KillerCoda.
* Execute fundamental Docker CLI commands.
* Pull and run an Nginx container.
* Manage and terminate a Docker container.
* Document container operations using Markdown.

## Docker Commands Executed

### Docker Version

```bash
docker --version
```

### Docker Information

```bash
docker info
```

### Pull Nginx Image

```bash
docker pull nginx
```

### Run Nginx Container

```bash
docker run -d -p 8080:80 --name my-nginx nginx
```

### Test Nginx

```bash
curl http://localhost:8080
```

### List Running Containers

```bash
docker ps
```

### Stop Container

```bash
docker stop my-nginx
```

### List All Containers

```bash
docker ps -a
```

### Remove Container

```bash
docker rm my-nginx
```

## Skills Learned

In this laboratory activity, I learned how to use basic Docker commands and how containers work. I learned how to pull a Docker image, create and run a container, map a network port, and test a web server. I also learned how to stop and remove a container using Docker commands.

## Challenges Encountered

One challenge I encountered was understanding the difference between a Docker image and a container. I also needed to understand how port mapping works when accessing the Nginx web server. After executing the commands and observing the results in the terminal, I became more familiar with the basic Docker workflow.

