# Docker Deployment

## Checkpoint 3 - Verify Docker

### Check Docker Version

```bash
docker --version
```

This command displays the installed Docker version and confirms that Docker is available in the environment.

### Check Docker Information

```bash
docker info
```

This command displays information about the Docker environment, including containers, images, and the Docker server.

---

## Checkpoint 4 - Deploy Nginx

### Pull the Nginx Image

```bash
docker pull nginx
```

This command downloads the official Nginx image from Docker Hub.

### Run the Nginx Container

```bash
docker run -d -p 8080:80 --name my-nginx nginx
```

This command creates and runs an Nginx container in detached mode and maps port 8080 on the host to port 80 inside the container.

### Test the Nginx Web Server

```bash
curl http://localhost:8080
```

This command sends a request to the Nginx web server through port 8080 and displays the returned HTML in the terminal.

---

## Checkpoint 5 - Container Lifecycle

### List Running Containers

```bash
docker ps
```

This command lists the Docker containers that are currently running.

### Stop the Container

```bash
docker stop my-nginx
```

This command stops the running Nginx container named `my-nginx`.

### Verify the Container is Stopped

```bash
docker ps -a
```

This command lists all containers, including stopped containers, allowing the status of `my-nginx` to be checked.

### Remove the Container

```bash
docker rm my-nginx
```

This command removes the stopped `my-nginx` container completely.

