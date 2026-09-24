# Mission Reflection

This laboratory activity helped me understand why object storage is useful for applications that need to store a large amount of data, especially photos. Object storage is better suited for storing millions of photos because it is designed for large amounts of unstructured data. Instead of keeping the photos directly inside the web server container, the files can be stored separately in an object storage system such as MinIO.

Docker made deploying the MinIO storage server easier because I only needed to run a Docker command to download and start the MinIO container. The command also allowed me to configure the ports, username, and password using environment variables. This made the deployment process faster and avoided having to manually install and configure all the components of the storage server.

A bucket is a storage container used to organize objects or files in an object storage system. In this activity, I created a bucket named `client-photos` and used it to store a sample file. This helped me understand how files can be organized in cloud object storage.

Large enterprise companies can reduce the risk of losing data when a physical server crashes by maintaining copies of data and using reliable storage systems. Having multiple copies can help make the data available even when one physical server experiences a problem.

My confidence in navigating the Linux command line is also improving. At first, commands can be difficult to remember, but using Docker commands and checking the running container with `docker ps` gave me more experience. This activity helped me become more comfortable using the terminal to deploy and manage a cloud service.
