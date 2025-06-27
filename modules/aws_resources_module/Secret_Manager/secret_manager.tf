module "wordpress_db_password" {
  source  = "terraform-aws-modules/secrets-manager/aws"
  version = "1.3.1"

  name                    = local.database_password_name
  description             = local.database_password_description
  recovery_window_in_days = local.secret_recovery_period
  secret_string           = var.database_password
  create_policy           = true

  tags = {
    Environment = "interview"
    Project     = "wordpress"
  }
}

module "wordpress_admin_password" {
  source  = "terraform-aws-modules/secrets-manager/aws"
  version = "1.3.1"

  name                    = local.admin_password_name
  description             = local.admin_password_description
  recovery_window_in_days = local.secret_recovery_period
  secret_string           = var.admin_password
  create_policy           = true

  tags = {
    Environment = "interview"
    Project     = "wordpress"
  }
}