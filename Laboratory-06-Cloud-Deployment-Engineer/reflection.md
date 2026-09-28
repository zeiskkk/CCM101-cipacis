# Mission Reflection

Writing a `docker-compose.yml` file makes a cloud engineer's job easier because the configuration for the application can be placed in one file. Instead of manually typing several Docker commands, Docker Compose can use the configuration file to create and start the required containers. This makes the deployment process more organized and repeatable.

I also learned that YAML is sensitive to indentation. An indentation error, such as using a Tab instead of spaces, can cause the YAML file to be invalid or prevent Docker Compose from correctly reading the configuration. This showed me that proper formatting is important when working with configuration files.

Environment variables such as `MYSQL_PASSWORD`, `MYSQL_DATABASE`, and `MYSQL_USER` are used to provide configuration information to the containers. They allow the Nextcloud and MariaDB containers to use the required database settings and establish communication between the application and database.

Deploying Nextcloud in only a few minutes gave me a better understanding of how cloud technologies can simplify application deployment. Instead of installing every component manually, Docker and Docker Compose allowed the application and database to be deployed as connected containers.

Since Mission 1, my understanding of Cloud Computing has changed from mainly learning basic cloud concepts to gaining practical experience with Linux, Docker, storage, and application deployment. I have learned that cloud computing involves more than simply storing data online. It also involves infrastructure, networking, containers, automation, deployment, and managing different services that work together. This activity helped me understand the basic idea of Infrastructure as Code because the deployment configuration was written in a YAML file and used to create the application environment.
