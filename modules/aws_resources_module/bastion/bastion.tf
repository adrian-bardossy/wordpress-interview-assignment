module "key-pair" {
  source  = "terraform-aws-modules/key-pair/aws"
  version = "2.0.3"

  key_name              = var.instance_key_name
  create_private_key    = true
  private_key_algorithm = "RSA"
  private_key_rsa_bits  = 4096
  tags = {
    name       = "${local.pem_key_name}"
    DeployedBy = "Terraform"
    Deployer   = "AdrianBardossy"
  }
}

resource "local_file" "KP_pem_key" {
  content         = module.key-pair.private_key_pem
  filename        = "${path.root}/${local.pem_key_name}.pem"
  file_permission = "0400"
}

module "ssh_only_my_ip_sg" {
  source  = "terraform-aws-modules/security-group/aws//modules/ssh"
  version = "5.2.0"

  name                = local.ssh_only_my_ip_sg_name
  description         = "SSH security group allowing only my IP"
  vpc_id              = var.vpc_id
  ingress_cidr_blocks = [var.public_ip]
  ingress_rules       = ["ssh-tcp"]
  egress_cidr_blocks  = ["0.0.0.0/0"]
  egress_rules        = ["all-all"]

  tags = {
    name        = local.ssh_only_my_ip_sg_name
    description = "SSH security group for my IP only"
    deployedBy  = "Terraform"
    deployer    = "AdrianBardossy"
  }
}


data "aws_ami" "ubuntu_24" {
  most_recent = true
  owners      = ["099720109477"]
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.04-amd64-server-*"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}


resource "aws_eip" "ubuntu_eip" {
  domain = "vpc"
}

resource "aws_eip_association" "ubuntu_eip_association" {
  instance_id   = aws_instance.ubuntu_instance.id
  allocation_id = aws_eip.ubuntu_eip.id
}

resource "aws_instance" "ubuntu_instance" {
  ami                         = data.aws_ami.ubuntu_24.id
  instance_type               = local.instance_type
  subnet_id                   = var.vpc_subnet
  vpc_security_group_ids      = [module.ssh_only_my_ip_sg.security_group_id]
  key_name                    = module.key-pair.key_pair_name
  associate_public_ip_address = false

  user_data = file("${path.module}/input_server_data.sh")

  tags = {
    Name       = var.instance_name
    managed_by = "Terraform"
    deployedBy = "Terraform"
    deployer   = "AdrianBardossy"
  }
  depends_on = [module.key-pair]
}
