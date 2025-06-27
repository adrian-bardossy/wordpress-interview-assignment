variable "k8s_namespace" {
  type        = string
  description = "k8s namespace to deploy into"
}

variable "db_password" {
  sensitive   = true
  type        = string
  description = "DB password to be stored in secrets on k8s"
}

variable "kms_key_id" {
  type        = string
  description = "KMS encryption key id"
}