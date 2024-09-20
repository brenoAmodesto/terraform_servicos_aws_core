module "ec2_private" {
  depends_on             = [module.vpc]
  source                 = "terraform-aws-modules/ec2-instance/aws"
  version                = "5.6.1"
  name                   = "${var.environment}-vm"
  ami                    = data.aws_ami.amzlinux2.id
  instance_type          = var.instance_type
  user_data              = file("${path.module}/app1.sh")
  vpc_security_group_ids = [module.private_sg.security_group_id]
  #instance_count         = var.private_instance_count
  #subnet_ids = [
  #  module.vpc.private_subnets[0],
  #  module.vpc.private_subnets[1],
  #]


  tags = local.common_tags

  for_each  = toset(["0", "1"])
  subnet_id = element(module.vpc.private_subnets, tonumber(each.key))

}

# Meta-Argument Depends On

