output "ubuntu_eip_public_ip" {
  value = aws_eip.ubuntu_eip.public_ip
  description = "Published pubic IP (Elastic IP) of the instance"
}
