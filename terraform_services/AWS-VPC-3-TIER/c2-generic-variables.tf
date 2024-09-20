# AWS Region

variable "aws_region" {
  description = "Region in which AWS Resources to be created"
  type = string
  default = "us-east-1"
}

# Environment Variable

variable "environment" {
  description = "Environment Variable used as a prefix"
  type = string
  default = "dev"
}

# Bussiness Division

variable "business_divsion" {
  description = "Business Division in the large organization this"
  type = string
  default = "SAP"
}
