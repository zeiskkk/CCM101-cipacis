# Types of Cloud Storage

| Storage Type   | Description                                                                         | Primary Use Case                                                                       | Cloud Provider Example |
| -------------- | ----------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------- | ---------------------- |
| Block Storage  | Stores data in fixed-size blocks that can be managed like a traditional hard drive. | Virtual machines, operating systems, and applications that need direct storage access. | AWS EBS                |
| File Storage   | Stores data as files organized in folders and directories.                          | Shared files and applications that need access to a common file system.                | AWS EFS                |
| Object Storage | Stores data as objects together with metadata and a unique identifier.              | Large amounts of unstructured data such as photos, videos, backups, and other files.   | AWS S3                 |

## Why Object Storage is Suitable for the Client

Object Storage is a good choice for the client's photo-sharing application because it is designed for storing large amounts of unstructured data such as images. It allows the application to store uploaded photos separately from the web server containers, making it suitable for a system that needs to handle millions of photos.

