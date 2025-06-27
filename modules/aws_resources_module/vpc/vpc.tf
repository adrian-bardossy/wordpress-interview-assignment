module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.21.0"

  name                 = local.vpc_name
  cidr                 = local.vpc_subnet
  azs                  = local.azs
  public_subnets       = local.public_subnets
  private_subnets      = local.private_subnets
  enable_dns_hostnames = true
  enable_nat_gateway   = true
  tags = {
    deployedBy = "terraform"
  }
}
