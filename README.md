🚀 AWS IAM Organization Setup using Terraform
📌 Overview

This project implements an enterprise-grade AWS IAM organizational model using Terraform with a modular architecture and remote state backend.

It simulates a real-world company environment (“Technova”) with structured departments, role-based access control, least-privilege policies, and enforced security governance.

The project follows production-style Git workflow (feature branches + pull requests + semantic versioning) to reflect real DevOps practices.

🏢 Business Scenario

A company with 25 employees across three departments requires:

Structured IAM grouping

Role-based access control (RBAC)

Least-privilege enforcement

Centralized security governance

MFA enforcement for privileged actions

Version-controlled infrastructure

This Terraform project provisions and secures that entire model.

🏗 Architecture
Departments

Developers (10 users)

QA (8 users)

Helpdesk (7 users)

Each department:

Has a dedicated IAM group

Has a custom least-privilege IAM policy

Users are automatically attached using Terraform for_each

Access boundaries enforced via policy documents

🔐 Security Controls Implemented
Account Password Policy

Minimum password length: 14

Password reuse prevention: 10

Password expiration: 90 days

Hard expiry enabled

Uppercase, lowercase, numbers, symbols required

MFA Enforcement

A conditional deny policy ensures:

All API actions are denied if MFA is not configured

Only MFA setup and authentication actions are allowed without MFA

This simulates enterprise-grade security posture.

🧱 Terraform Architecture
Remote Backend

S3 bucket for remote state

DynamoDB table for state locking

State consistency ensured across environments

Modular Structure

.
├── main.tf
├── provider.tf
├── versions.tf
├── security.tf
├── policies.tf
├── modules/
│   └── users/
│       ├── main.tf
│       ├── variables.tf
│       └── outputs.tf


Design Principles

Separation of concerns

Reusable module design

Root module kept minimal

No state destruction during refactor (terraform state mv used)

🛠 Terraform Operations Performed
terraform init
terraform validate
terraform fmt
terraform plan
terraform apply
terraform state mv


State integrity was preserved during modular refactoring.

🔁 Git Workflow (Enterprise Simulation)

Feature branching strategy

Pull request–based merges

Merge commits (not squash)

Semantic versioning

Release tagging

This simulates real enterprise DevOps collaboration.

🏷 Release History

v1.0.0 — Initial IAM users and groups

v1.1.0 — Custom least-privilege policies

v1.2.0 — Modular refactor + MFA enforcement + enhanced password security

🎯 What This Project Demonstrates

Terraform modular architecture

Remote backend configuration

IAM least-privilege design

Security governance enforcement

MFA conditional policy design

State migration without infrastructure destruction

Enterprise Git workflow

Infrastructure lifecycle management

📈 Future Enhancements (Planned)

GitHub Actions CI pipeline for Terraform validation

Multi-environment support using workspaces (dev/prod)

Cost governance controls

AWS Organizations multi-account model

Policy-as-Code validation (OPA or Sentinel)
