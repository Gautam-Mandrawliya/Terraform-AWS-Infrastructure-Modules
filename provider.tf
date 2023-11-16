# Terraform Provider Configuration!
provider "aws" {
  region = var.region
}

# Versions of Terraform and Terraform Provider!
terraform {
  required_version = ">= 1.6.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.24.0"
    }
  }

  # Terraform Backend Configuration of AWS Provider using AWS S3 Bucket and Locking Mechanism!
  backend "s3" {
    bucket = "gautam-terraform-tfstate-bucket"
    region = "ap-south-1"
    key    = "terraform.tfstate"
    #dynamodb_table = "########"
  }
}