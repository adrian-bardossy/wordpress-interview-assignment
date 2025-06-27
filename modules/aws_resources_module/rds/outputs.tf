output "rds_instance_id" {
  value = module.rds.db_instance_identifier
  description = "Published Maria DB database instance endpoint identifier"
}

output "db_name" {
  value = local.db_name
  description = "Publish database name for the usage in the other modules"
}

