# Cloud Provider Comparison

## AWS vs Microsoft Azure vs Google Cloud Platform

The three major public cloud providers offer similar infrastructure services, but they use different service names and provide different features.

| Infrastructure Component | AWS | Microsoft Azure | Google Cloud Platform |
|---|---|---|---|
| Compute | Amazon EC2 | Azure Virtual Machines | Google Compute Engine |
| Storage | Amazon S3 | Azure Blob Storage | Google Cloud Storage |
| Networking | Amazon VPC | Azure Virtual Network (VNet) | Google Cloud VPC |
| Identity and Access Management (IAM) | AWS IAM | Microsoft Entra ID / Azure RBAC | Google Cloud IAM |

### Compute

AWS provides Amazon EC2, which offers scalable virtual servers that can be configured for different workloads. Azure provides Virtual Machines, while Google Cloud provides Compute Engine for running virtual machines and other computing workloads. :contentReference[oaicite:1]{index=1}

### Storage

AWS provides Amazon S3 for storing and retrieving data. Azure provides Azure Storage, including Blob Storage, while Google Cloud provides Cloud Storage for storing and retrieving data in the cloud. :contentReference[oaicite:2]{index=2}

### Networking

AWS uses Amazon VPC to create logically isolated virtual networks for AWS resources. Azure uses Virtual Network (VNet) to connect virtual machines and other resources, while Google Cloud provides Virtual Private Cloud (VPC) networking for cloud resources. :contentReference[oaicite:3]{index=3}

### Identity and Access Management (IAM)

AWS IAM controls access to AWS services and resources using identities, credentials, and permissions. Azure uses Microsoft Entra ID together with Azure role-based access control, while Google Cloud IAM manages permissions by controlling who can access which resources and what actions they can perform. :contentReference[oaicite:4]{index=4}

---

# Guide Questions

## 1. Which cloud provider offers the broadest range of services? Explain your answer.

AWS is generally considered to offer one of the broadest ranges of cloud services. It provides services covering computing, storage, networking, databases, security, analytics, artificial intelligence, and many other areas.

## 2. Which cloud platform would you recommend for an organization that primarily uses Microsoft products? Why?

I would recommend Microsoft Azure for an organization that primarily uses Microsoft products. Azure works closely with Microsoft technologies and provides services such as Microsoft Entra ID, Azure Virtual Machines, and Azure Storage, making integration easier for organizations already using the Microsoft ecosystem.

## 3. Which platform is widely recognized for Artificial Intelligence (AI), Machine Learning (ML), and Kubernetes services?

Google Cloud Platform is widely recognized for its strengths in Artificial Intelligence, Machine Learning, and Kubernetes. Google Cloud provides AI and ML services and is closely associated with Kubernetes through Google Kubernetes Engine (GKE).

## 4. What similarities did you observe among the three cloud providers?

All three cloud providers offer the same major categories of cloud infrastructure, including compute, storage, networking, and identity and access management. They also provide scalable resources that allow organizations to deploy applications and services without maintaining all of the physical infrastructure themselves.

---

# Conclusion

AWS, Microsoft Azure, and Google Cloud Platform provide similar fundamental cloud infrastructure capabilities but use different service names and technologies. Understanding the equivalent services helps cloud engineers choose the appropriate platform and transfer their knowledge between different cloud environments.

# Sources

- AWS Documentation - Amazon EC2
- AWS Documentation - Amazon VPC
- AWS Documentation - AWS IAM
- Microsoft Learn - Azure Virtual Machines
- Microsoft Learn - Azure Virtual Network
- Microsoft Learn - Microsoft Entra ID
- Google Cloud Documentation - Compute Engine
- Google Cloud Documentation - Cloud Storage
- Google Cloud Documentation - Google Cloud IAM
