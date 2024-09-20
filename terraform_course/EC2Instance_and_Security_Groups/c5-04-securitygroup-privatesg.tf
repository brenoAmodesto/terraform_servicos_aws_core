module "private_sg" {
    
    source  = "terraform-aws-modules/security-group/aws"
    version = "5.1.0"

    name = "private-sg"
    description = "Security group with HTTP & SSH ports open for everybody (IPV4 CIDR), egress ports are all world open"
    vpc_id = module.vpc.vpc_id
    ingress_rules = ["ssh-tcp", "http-80-tcp"]
    ingress_cidr_blocks = ["0.0.0.0/0"]

    egress_rules =["all-all"]


    tags = local.common_tags

}