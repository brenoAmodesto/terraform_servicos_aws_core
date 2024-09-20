variable "instance_type" {
  description = "EC2 Instance Type"
  type        = string
  default     = "t3.micro"
}

variable "instance_keypair" {
  description = "AWS EC2 Key pair that need to be associated with ec2 Instance"
  type        = string
  default     = "terraform-key"
}

# AWS EC2 Private Instance Count

variable "private_instance_count" {
    description = "AWS EC2 Private Instances Count"
    type = number
    default = 1
}
