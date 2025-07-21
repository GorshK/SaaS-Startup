# SaaS Infrastructure on AWS (Terraform)

This project provisions a basic but production-ready secure infrastructure for a SaaS application using AWS and Terraform. It is fully automated and deploys highly available components across multiple Availability Zones.

---

## 📐 Infrastructure Architecture

- VPC with public and private subnets in 2 Availability Zones  
- Internet Gateway for public access  
- NAT Gateway (1) for private subnet outbound internet access  
- Application Load Balancer (ALB) across public subnets  
- EC2 instances (app servers) in private subnets  
- RDS (MySQL) database in private subnets  
- Security Groups for network control  
- Route Tables for routing management  
- Outputs ALB DNS name  

---

## 🔒 Security Model

- Load Balancer publicly accessible on port 80  
- EC2 instances only accessible via ALB (no public IPs)  
- Database accessible only from EC2 Security Group  
- NAT Gateway allows private subnets to reach the internet for updates  
- Multi-AZ deployment for high availability  

---

## 🚀 Prerequisites

- AWS Account with sufficient permissions  
- AWS CLI installed and configured (`aws configure`)  
- Terraform installed (v1.0+ recommended)  

---


## 🛠️ How to Deploy

**Clone the repository:**

```bash
git clone https://github.com/GorshK/SaaS-Startup.git
cd saas-infra-terraform

Initialize Terraform:
terraform init

Validate the configuration:
terraform validate

Apply the infrastructure:
terraform apply
Confirm when prompted with yes.

🧹 Cleanup
To destroy the infrastructure when no longer needed:
terraform destroy
