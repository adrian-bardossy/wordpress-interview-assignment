module "kms" {
  source  = "terraform-aws-modules/kms/aws"
  version = "3.1.1"

  create       = true
  description       = local.description
  enable_key_rotation = true

  aliases = [var.kms_alias_name]

  tags = {
    Environment = "interview"
    Project     = "wordpress"
  }
}