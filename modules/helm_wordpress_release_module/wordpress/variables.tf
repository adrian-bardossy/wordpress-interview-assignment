variable "db_host" {
  type = string
}

variable "db_name" {
  type = string
}

variable "db_username" {
  type      = string
  sensitive = true
}

variable "db_password" {
  type      = string
  sensitive = true
}

variable "certificate_secret_identifier" {
  type = string
}

variable "k8s_namespace" {
  type    = string
  default = "wordpress"
}