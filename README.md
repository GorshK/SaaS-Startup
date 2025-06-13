# SaaS Infrastructure on AWS (Terraform)

This project provisions a basic but production-ready secure infrastructure for a SaaS application using AWS and Terraform.

It is fully automated and deploys highly available components across multiple Availability Zones.
---
## Infrastructure Architecture

-  VPC with public and private subnets in 2 Availability Zones.
-  Internet Gateway for public access.
-  NAT Gateway (1) for private subnet outbound internet access.
-  Application Load Balancer (ALB) across public subnets.
-  EC2 instances (app servers) in private subnets.
-  RDS (MySQL) database in private subnets.
-  Security Groups for network control.
-  Route Tables for routing management.
-  Outputs ALB DNS name.
  
---
## Security Model

- Load Balancer publicly accessible on port 80.
- EC2 instances only accessible via ALB (no public IPs).
- Database accessible only from EC2 Security Group.
- NAT Gateway allows private subnets to reach internet for updates, installs, etc.
- Multi-AZ deployment for high availability.

---
## 🚀 Prerequisites

- AWS Account with sufficient permissions
- AWS CLI installed and configured (`aws configure`)
- Terraform installed (v1.0+ recommended)
---
## Project Structure

.
├── main.tf               # VPC, Subnets, NAT, IGW, Route Tables
├── alb.tf                # Application Load Balancer
├── ec2.tf                # EC2 Instances
├── rds.tf                # RDS Database
├── security_groups.tf    # Security Groups
├── variables.tf          # Variables file
├── outputs.tf            # Outputs
└── README.md             # This file
---
How to Deploy
1️⃣ Clone the repository:
git clone https://github.com/your-username/saas-infra-terraform.git
cd saas-infra-terraform
2️⃣ Initialize Terraform:
terraform init
3️⃣ Validate the configuration:
terraform validate
4️⃣ Apply the infrastructure:
terraform apply
5️⃣ Confirm when prompted with yes.
🧹 Cleanup
To destroy the infrastructure when no longer needed:
terraform destroy




