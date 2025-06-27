output "key_id" {
  value = module.kms.key_id
  description = "Published value of the key id deployed with KMS"
}

output "key_arn" {
  value = module.kms.key_arn
  description = "Published value of the Key in the KMS - its ARN (Amazon Resource Name)"
}
