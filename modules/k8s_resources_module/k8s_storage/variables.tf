variable "k8s_storage_class_name" {
  type        = string
  description = "Storage class name"
}

variable "k8s_pv_name" {
  type        = string
  description = "K8s persistent volume wordpress name"
}

variable "k8s_pvc_name" {
  type        = string
  description = "K8s persistent volume claim name"
}

variable "k8s_namespace" {
  type        = string
  description = "Namespace of wordpress app in cluster"
}

variable "ebs_volume_id" {
  type        = string
  description = "Persistent volume storage class AWS EBS volume"
}