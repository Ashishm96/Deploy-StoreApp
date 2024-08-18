# Store App Deployment with Terraform and Nginx

This project demonstrates how to deploy a Node.js store application using AWS EC2, Nginx, and Terraform.

## Structure

- **terraform/**: Contains Terraform configuration files.
- **nginx/**: Contains the Nginx configuration for the store app.

## Prerequisites

1. AWS account and credentials.
2. SSH key pair (`key-pair`) configured in AWS.
3. Terraform installed locally.

## Steps to Deploy

1. Initialize Terraform:
   ```bash
   terraform init
