output "db_password_secret_name" {
  value = local.db_password_secret_identifier
  description = "Database password kubernetes secret identifier"
}
