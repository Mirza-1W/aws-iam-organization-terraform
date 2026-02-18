Project: AWS IAM Organization Setup using Terraform
📌 Overview

This project provisions and secures an AWS IAM organizational structure using Terraform.
It follows modular design principles and enforces enterprise-grade security controls.

The infrastructure includes:

IAM users across multiple departments

IAM groups and role-based access

Custom least-privilege policies

Strict account password policy

MFA enforcement

Modular Terraform architecture

Version-controlled infrastructure lifecycle

🏗 Architecture

Departments:

Developers (10 users)

QA (8 users)

Helpdesk (7 users)

Each department:

Has its own IAM group

Has a custom IAM policy

Users automatically attached via Terraform

Security Controls:

Minimum password length: 14

Password reuse prevention: 10

Hard password expiry enabled

MFA required for privileged operations

📂 Project Structure
.
├── main.tf
├── security.tf
├── policies.tf
├── modules/
│   └── users/
│       ├── main.tf
│       ├── variables.tf
│       └── outputs.tf
├── versions.tf
├── provider.tf

🔐 Security Implementation

Enforced IAM password policy

MFA conditional deny policy

Least-privilege access per department

Controlled EC2/S3 access based on role

🚀 Terraform Commands Used
terraform init
terraform plan
terraform apply
terraform validate
terraform fmt
terraform state mv

🏷 Versioning

Release Tags:

v1.0.0 — IAM users and groups

v1.1.0 — Custom least-privilege policies

v1.2.0 — Modular refactor + MFA enforcement

🎯 What This Project Demonstrates

Terraform modular architecture

State management

IAM security best practices

Git branching workflow

Infrastructure version control

Enterprise security enforcement
