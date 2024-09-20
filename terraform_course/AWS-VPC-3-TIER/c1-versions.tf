#Terraform Block

terraform {
  required_version = "~> 1.8.0" # wich means any version equal & above
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.30"

      
    }
  }
}

# Provider Block
provider "aws" {
  region = var.aws_region
}