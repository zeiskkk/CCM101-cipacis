Mission Reflection

This laboratory activity helped me understand how containerization and Docker can be used in cloud computing. One of the main things I learned was the difference between starting a Docker container and installing an operating system on a Virtual Machine. A Virtual Machine needs to start a complete guest operating system and usually requires more resources. In comparison, a Docker container uses an existing host operating system and can start much faster because it does not need a complete operating system of its own.

The port mapping -p 8080:80 is necessary because the Nginx web server is running inside the container on port 80. The host uses port 8080 to provide access to that service from outside the container. When I used curl http://localhost:8080, the request was forwarded to port 80 inside the Nginx container, which allowed me to see the Nginx welcome page.

I also learned what happens when a container is removed using docker rm. The container itself is deleted, so its container-specific data is no longer available. However, removing the container does not automatically remove the Docker image used to create it.

Containerization can also improve the way developers and IT operations teams work together. Developers can package applications in containers so that they can be run consistently in different environments. This can make deployment and collaboration easier and supports the ideas behind DevOps.

Finally, my GitHub portfolio is continuing to grow as I complete more cloud computing laboratory activities. Each laboratory adds new documentation, commands, screenshots, and knowledge. This activity added Docker and containerization to my portfolio and helped me gain more practical experience with cloud-native technologies.
