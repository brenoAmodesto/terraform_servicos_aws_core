output "ec2_bastion_public_instance_ids" {
  description = "List of IDS of instances"
  value       = module.ec2_public.id
}

output "ec2_bastion_public_ip" {
  description = "List of Public ip address assigned to the instances"
  value       = module.ec2_public.public_ip
}

# Private EC2 Instances

output "ec2_private_instance_ids" {
  description = "List of IDs of Instances"
  value       = [for ec2private in module.ec2_private : ec2private.id]
}

output "ec2_private_ip" {
  description = "List of private ip address assigned to the instances"
  value       = [for ec2private in module.ec2_private : ec2private.private_ip]
}
