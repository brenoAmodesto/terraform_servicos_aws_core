module "alb" {
  source = "terraform-aws-modules/alb/aws"
  version = "9.11.1"

  name    = "alb-demo"
  load_balancer_type = application
  vpc_id  = module.vpc.vpc_id
  subnets = module.vpc.public_subnets
  security_groups = []

}
