# 🚀 Terraform AWS Infrastructure

This repository contains Terraform configurations for provisioning and managing AWS resources. It serves as a modular and reusable foundation for cloud infrastructure setup, ideal for development, staging, or production environments.

## 📦 Contents

- `vpc.tf` – Defines VPC, subnets, route tables, and internet gateway
- `security_groups.tf` – Configures security groups and rules
- `key_pair.tf` – Creates EC2 key pairs for SSH access
- `variables.tf` – Input variables for customization
- `outputs.tf` – Useful outputs like VPC ID, public IPs, etc.
- `provider.tf` – AWS provider configuration

## 🛠️ Prerequisites

- [Terraform](https://www.terraform.io/downloads) ≥ 1.0
- AWS CLI configured with credentials
- An AWS account with necessary IAM permissions

## 🚀 Usage

```bash
# Initialize Terraform
terraform init

# Preview changes
terraform plan

# Apply infrastructure
terraform apply