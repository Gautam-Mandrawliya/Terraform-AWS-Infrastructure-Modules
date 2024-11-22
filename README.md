# Terraform AWS Infrastructure Modules

This repository contains Terraform modules to set up AWS infrastructure for creating AMIs, an Application Load Balancer (ALB), a Target Group, and Auto Scaling Groups, etc.

## Table of Contents

- [Prerequisites](#prerequisites)
- [Getting Started](#getting-started)
- [Module Descriptions](#module-descriptions)
- [Usage](#usage)
- [Workspace Configuration](#workspace-configuration)
- [License](#license)

## Prerequisites

Before using these Terraform modules, ensure you have the following installed and configured:

- [Terraform](https://www.terraform.io/downloads.html)
- [AWS CLI](https://aws.amazon.com/cli/)

## Getting Started

1. Clone this repository:

   git clone https://github.com/Gautam-Mandrawliya/Terraform-AWS-Infrastructure-Modules.git

   cd Terraform-AWS-Infrastructure-Modules


2. Initialize Terraform:
    
    terraform init


3. Create a new Terraform workspace for your environment:

    terraform workspace new dev

    terraform workspace new prod


4. Test and apply the Terraform configuration:

    terraform plan

    terraform apply

## Module Descriptions

1. AMI Module (modules/aws-ami)

   This module creates an AWS AMI using Packer.


2. Application Load Balancer Module (modules/application-elb/alb)

   This module provisions an Application Load Balancer (ALB) with associated resources.


3. Target Group Module (modules/application-elb/target-group)

   This module provisions a Target Group (TG) with associated resources.


4. Auto Scaling Module (modules/auto-scaling)

   This module sets up Auto Scaling Groups using the created AMI and associates them with the ALB.

## Usage

To use these modules, reference them in your Terraform configuration files. Please see the resource.tf file.

## Terraform Backend Configuration

The Terraform state file is stored remotely in an S3 bucket. Ensure that you configure the backend appropriately for your project.

    terraform {
        backend "s3" {
            bucket = "your-terraform-state-bucket"
            key    = "path/to/terraform.tfstate"
            region = "your-aws-region"
        }
    }


## Workspace Configuration

Created separate terraform.tfvars files for each environment (dev and prod). Customize the variables based on your specific requirements.

## License

This project is licensed under the MIT License - see the LICENSE file for details.

Replace placeholders like `"Gautam Mandrawliya"`, and others with your actual information. Additionally, make sure to include specific details about variables and configurations in each module as needed.
