output "certificate_secret_identifier" {
  value = local.issued_certificate_secret
  description = "Name of the issued certificate managed by cert-manager secret"
}