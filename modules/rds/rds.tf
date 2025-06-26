module "rds_sg" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "4.13.0"

  name        = local.rds_sg_name
  description = "Security group for RDS MariaDB allowing EKS access"
  vpc_id      = var.vpc_id


  ingress_with_cidr_blocks = [
    {
      from_port   = 3306
      to_port     = 3306
      protocol    = "tcp"
      cidr_blocks = module.rds_sg.security_group_id
      description = "Allow MySQL access from VPC CIDRs"
    }
  ]

  egress_with_cidr_blocks = [
    {
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = "0.0.0.0/0"
      description = "Allow all outbound traffic"
    }
  ]

  tags = {
    creator = "AdrianBardossy"
  }
}

module "rds" {
  source  = "terraform-aws-modules/rds/aws"
  version = "6.12.0"

  identifier              = local.db_name
  engine                  = "mariadb"
  engine_version          = "11.4.5"
  instance_class          = "db.t3.medium"
  allocated_storage       = 20
  storage_type            = "gp3"
  storage_encrypted       = true
  username                = local.db_username
  password                = var.db_password
  port                    = 3306
  vpc_security_group_ids  = [module.rds_sg.security_group_id]
  subnet_ids              = var.subnet_ids
  publicly_accessible     = false
  multi_az                = false
  backup_retention_period = 7
  skip_final_snapshot     = true
  family                  = "mariadb11.4"
  major_engine_version    = "11.4"

  tags = {
    Environment = "interview"
    Project     = "wordpress"
  }
}
