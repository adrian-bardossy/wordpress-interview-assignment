output "release_name" {
  value = helm_release.external_dns.name
  description = "Name of the release"
}

output "service_account_name" {
  value = local.service_account_name
  description = "Name of the service account name"
}
