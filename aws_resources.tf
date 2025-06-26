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
  source      = "./modules/rds"
  vpc_id      = module.VPC.vpc_id
  db_username = var.db_username
  db_password = var.db_password
  subnet_ids = flatten([
    module.VPC.vpc_public_subnet_id,
    module.VPC.vpc_private_subnet_id
  ])
}

module "bastion" {
  source            = "./modules/bastion"
  instance_name     = var.instance_name
  vpc_id            = module.VPC.vpc_id
  vpc_subnet        = module.VPC.vpc_public_subnet_id[0]
  instance_key_name = var.instance_key_name
  public_ip         = var.public_ip
}

module "EBS" {
  source = "./modules/EBS"
}

module "Route53" {
  source = "./modules/Route53"
  a_record_alias = var.a_record_alias
  a_record_values = var.a_record_values
}

module "ACM" {
  source = "./modules/ACM"
  domain_name = var.domain_name
  zone_id = module.Route53.zone_id
}

module "KMS" {
  source = "./modules/KMS"
  kms_alias_name = var.kms_alias_name
}