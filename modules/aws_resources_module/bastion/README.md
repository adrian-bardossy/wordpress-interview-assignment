## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |
| <a name="provider_local"></a> [local](#provider\_local) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_key-pair"></a> [key-pair](#module\_key-pair) | terraform-aws-modules/key-pair/aws | 2.0.3 |
| <a name="module_ssh_only_my_ip_sg"></a> [ssh\_only\_my\_ip\_sg](#module\_ssh\_only\_my\_ip\_sg) | terraform-aws-modules/security-group/aws//modules/ssh | 5.2.0 |

## Resources

| Name | Type |
|------|------|
| [aws_eip.ubuntu_eip](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eip) | resource |
| [aws_eip_association.ubuntu_eip_association](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eip_association) | resource |
| [aws_instance.ubuntu_instance](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance) | resource |
| [local_file.KP_pem_key](https://registry.terraform.io/providers/hashicorp/local/latest/docs/resources/file) | resource |
| [aws_ami.ubuntu_24](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ami) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_instance_key_name"></a> [instance\_key\_name](#input\_instance\_key\_name) | Instance KP key name to access the instance with | `string` | n/a | yes |
| <a name="input_instance_name"></a> [instance\_name](#input\_instance\_name) | Name of the ec2 instance | `string` | n/a | yes |
| <a name="input_public_ip"></a> [public\_ip](#input\_public\_ip) | Public IP to be used to be able to access the instance from please consider using IP/32 | `string` | n/a | yes |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | VPC ID used to deploy the instance into | `string` | n/a | yes |
| <a name="input_vpc_subnet"></a> [vpc\_subnet](#input\_vpc\_subnet) | Subnet used for the instance | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_ubuntu_eip_public_ip"></a> [ubuntu\_eip\_public\_ip](#output\_ubuntu\_eip\_public\_ip) | Published pubic IP (Elastic IP) of the instance |
