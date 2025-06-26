module "VPC" {
  source = "./modules/vpc"
}

module "eks" {
  source = "./modules/eks"
  vpc_id = module.VPC.vpc_id
  subnet_ids = flatten([
    module.VPC.vpc_public_subnet_id,
    module.VPC.vpc_private_subnet_id
  ])
  depends_on = [module.VPC]
}

module "RDS" {
  source         = "./modules/rds"
  vpc_id         = module.VPC.vpc_id
  db_password    = var.db_password
  subnet_ids = flatten([
    module.VPC.vpc_public_subnet_id,
    module.VPC.vpc_private_subnet_id
  ])
}