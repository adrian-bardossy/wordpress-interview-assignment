output "release_name" {
  value = helm_release.external_dns.name
}

output "service_account_name" {
  value = local.service_account_name
}
