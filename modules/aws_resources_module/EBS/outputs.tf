output "ebs_volume_id" {
  value = aws_ebs_volume.kubernetes_ebs_volume.id
  description = "Published EBS volume ID for the further usage"
}