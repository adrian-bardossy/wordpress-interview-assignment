locals {
  database_password_name        = "wordpress"
  database_password_description = "Database password for wordpress rds mariadb instance"
  admin_password_name = "wordpress"
  admin_password_description = "wordpress admin password to access gui admin"
  secret_recovery_period        = 30
}