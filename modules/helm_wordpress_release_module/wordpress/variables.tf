variable "db_host" {
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

variable "k8s_namespace" {
  type    = string
  default = "wordpress"
}