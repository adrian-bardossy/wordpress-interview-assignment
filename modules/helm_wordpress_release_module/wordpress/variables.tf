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
  description = "Certificate secret identifier used for wordpress deployment"
}

variable "k8s_namespace" {
  type = string
  description = "Kubernetes cluster namespace for the app deployment"
}

variable "wordpress_admin_password" {
  type      = string
  sensitive = true
  description = "Wordpress admin password"
}