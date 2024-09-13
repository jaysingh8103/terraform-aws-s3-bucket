# Terraform AWS S3 Static Website Setup

This Terraform configuration sets up an AWS S3 bucket to host a static website with public access. It includes the following features:
- S3 bucket creation
- Public access configuration
- Static website hosting
- Uploading `index.html` and `style.css` files

## Prerequisites

Before running the Terraform code, ensure you have the following installed:

1. [Terraform](https://learn.hashicorp.com/tutorials/terraform/install-cli) (version 1.0+)
2. [AWS CLI](https://aws.amazon.com/cli/) and an AWS account.
3. AWS credentials configured in your environment (`~/.aws/credentials` or through environment variables).

## AWS IAM Permissions

Ensure your IAM user has the following permissions:

- `s3:PutBucketPolicy`
- `s3:GetBucketPolicy`
- `s3:ListBucket`
- `s3:PutObject`
- `s3:GetObject`

## Setup

### 1. Clone the repository

```bash
git clone <your-repository-url>
cd project-static-website-1

1.terraform validate
2.terraform init
3.terraform plan
4.terraform apply





