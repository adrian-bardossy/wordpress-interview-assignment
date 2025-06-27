module "VPC" {
  source = "./modules/aws_resources_module/vpc"
}

module "eks" {
  source = "./modules/aws_resources_module/eks"
  vpc_id = module.VPC.vpc_id
  subnet_ids = flatten([
    module.VPC.vpc_public_subnet_id,
    module.VPC.vpc_private_subnet_id
  ])
  depends_on = [module.VPC]
}

module "RDS" {
  source      = "./modules/aws_resources_module/rds"
  vpc_id      = module.VPC.vpc_id
  db_username = var.db_username
  db_password = var.db_password
  subnet_ids = flatten([
    module.VPC.vpc_public_subnet_id,
    module.VPC.vpc_private_subnet_id
  ])
  depends_on = [
    module.VPC
  ]
}

module "bastion" {
  source            = "./modules/aws_resources_module/bastion"
  instance_name     = var.instance_name
  vpc_id            = module.VPC.vpc_id
  vpc_subnet        = module.VPC.vpc_public_subnet_id[0]
  instance_key_name = var.instance_key_name
  public_ip         = var.public_ip
  depends_on = [
    module.VPC
  ]
}

module "EBS" {
  source = "./modules/aws_resources_module/EBS"
}

module "Route53" {
  source          = "./modules/aws_resources_module/Route53"
  a_record_alias  = var.a_record_alias
  a_record_values = var.a_record_values
}

module "KMS" {
  source         = "./modules/aws_resources_module/KMS"
  kms_alias_name = var.kms_alias_name
}

module "Secret_Manager" {
  source            = "./modules/aws_resources_module/Secret_Manager"
  database_password = var.db_password
  admin_password    = var.wordpress_admin_password
  depends_on = [
    module.RDS,
    module.wordpress
  ]
}
