# AWS Infrastructure Provisioning using Terraform

---

## Overview
This project provisions a scalable and modular AWS infrastructure using Terraform as Infrastructure as Code (IaC).

It demonstrates real-world DevOps practices including modular architecture, multi-environment setup, and scalable cloud infrastructure design.

The infrastructure includes networking, security, load balancing, and auto-scaling compute resources.

---

## Architecture

### Networking
- VPC (10.0.0.0/16)
- Public and Private Subnets across multiple Availability Zones
- Internet Gateway (IGW)
- NAT Gateway for private subnet internet access
- Route Tables for traffic management

### Security
- Security Groups for ALB and EC2 instances

### Load Balancer
- Application Load Balancer (ALB)
- Target Groups for routing traffic

### Compute
- Launch Template
- Auto Scaling Group (ASG)
- EC2 instances in private subnets

---

## 📁 Project Structure

terraform-aws-infra  
├── provider.tf  
├── backend.tf  
├── README.md  
├── environments  
│   ├── dev  
│   │   ├── main.tf  
│   │   ├── variables.tf  
│   │   └── terraform.tfvars  
│   └── prod  
└── modules  
    ├── vpc  
    ├── subnet  
    ├── igw  
    ├── nat  
    ├── security-group  
    ├── alb  
    └── autoscaling  

---

## Prerequisites
- Terraform >= 1.5  
- AWS CLI configured with credentials  
- IAM user with required permissions  

---

## Execution Steps

terraform init  
terraform validate  
terraform plan  
terraform apply  

---

## Important Notes
- Terraform state is stored locally (remote backend not configured in this implementation)  
- NAT Gateway and ALB may incur AWS charges  
 
---

## Remote Backend (Conceptual)
Remote backend with state locking (S3 + DynamoDB) is not implemented in this project.

In production, Terraform state should be stored in S3 with DynamoDB locking to ensure consistency and avoid concurrent changes.

---

## Key Highlights
- Modular Terraform architecture  
- Multi-environment setup (dev/prod)  
- Highly available multi-AZ design  
- Scalable compute using Auto Scaling Group  
- Clean separation of networking and compute layers  

---

## Learning Outcome
- Infrastructure as Code using Terraform  
- AWS VPC, Subnet, Routing concepts  
- Load balancing and scaling architecture  
- Real-world DevOps debugging experience  
- Modular infrastructure design  

---

##  Evidence
Terraform Plan: 15 resources to add, 0 to change, 0 to destroy  
(Screenshot attached separately)

---
CI test trigger
