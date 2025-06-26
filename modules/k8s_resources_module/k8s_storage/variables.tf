variable "k8s_storage_class_name" {
  type        = string
  description = "storage class name"
}

variable "k8s_pv_name" {
  type        = string
  description = "k8s pv wordpress name"
}

variable "k8s_pvc_name" {
  type        = string
  description = "k8s pvc name"
}

variable "k8s_namespace" {
  type        = string
  description = "Namespace of wordpress app in cluster"
}

variable "ebs_volume_id" {
  type        = string
  description = "PV storage class AWS EBS volume"
}