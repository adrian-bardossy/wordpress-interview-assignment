resource "aws_ebs_volume" "kubernetes_ebs_volume" {
  availability_zone = local.availability_zone
  size              = local.ebs_size

  tags = {
    Product = "Jamf"
  }
}
