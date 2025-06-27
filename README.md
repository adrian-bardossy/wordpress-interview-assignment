## Module Descriptions
### AWS Resources Modules
#### VPC
- text

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 5.79 |
| <a name="requirement_helm"></a> [helm](#requirement\_helm) | ~> 2.8 |
| <a name="requirement_kubernetes"></a> [kubernetes](#requirement\_kubernetes) | ~> 2.23 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.100.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_EBS"></a> [EBS](#module\_EBS) | ./modules/aws_resources_module/EBS | n/a |
| <a name="module_KMS"></a> [KMS](#module\_KMS) | ./modules/aws_resources_module/KMS | n/a |
| <a name="module_RDS"></a> [RDS](#module\_RDS) | ./modules/aws_resources_module/rds | n/a |
| <a name="module_Route53"></a> [Route53](#module\_Route53) | ./modules/aws_resources_module/Route53 | n/a |
| <a name="module_Secret_Manager"></a> [Secret\_Manager](#module\_Secret\_Manager) | ./modules/aws_resources_module/Secret_Manager | n/a |
| <a name="module_VPC"></a> [VPC](#module\_VPC) | ./modules/aws_resources_module/vpc | n/a |
| <a name="module_bastion"></a> [bastion](#module\_bastion) | ./modules/aws_resources_module/bastion | n/a |
| <a name="module_cert-manager"></a> [cert-manager](#module\_cert-manager) | ./modules/helm_wordpress_release_module/cert-manager | n/a |
| <a name="module_eks"></a> [eks](#module\_eks) | ./modules/aws_resources_module/eks | n/a |
| <a name="module_external-dns"></a> [external-dns](#module\_external-dns) | ./modules/helm_wordpress_release_module/external-dns | n/a |
| <a name="module_ingress_nginx"></a> [ingress\_nginx](#module\_ingress\_nginx) | ./modules/helm_wordpress_release_module/ingress | n/a |
| <a name="module_k8s_namespace"></a> [k8s\_namespace](#module\_k8s\_namespace) | ./modules/k8s_resources_module/k8s_namespace | n/a |
| <a name="module_k8s_secrets"></a> [k8s\_secrets](#module\_k8s\_secrets) | ./modules/k8s_resources_module/k8s_secrets | n/a |
| <a name="module_k8s_storage"></a> [k8s\_storage](#module\_k8s\_storage) | ./modules/k8s_resources_module/k8s_storage | n/a |
| <a name="module_wordpress"></a> [wordpress](#module\_wordpress) | ./modules/helm_wordpress_release_module/wordpress | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_eks_cluster_auth.token](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/eks_cluster_auth) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_a_record_alias"></a> [a\_record\_alias](#input\_a\_record\_alias) | ALIAS record config, if using AWS resources | <pre>object({<br/>    name                   = string<br/>    zone_id                = string<br/>    evaluate_target_health = bool<br/>  })</pre> | `null` | no |
| <a name="input_a_record_values"></a> [a\_record\_values](#input\_a\_record\_values) | List of record values (IP addresses, etc.) | `list(string)` | `[]` | no |
| <a name="input_aws_region"></a> [aws\_region](#input\_aws\_region) | region to deploy the aws resources into | `string` | n/a | yes |
| <a name="input_db_password"></a> [db\_password](#input\_db\_password) | db password | `string` | n/a | yes |
| <a name="input_db_username"></a> [db\_username](#input\_db\_username) | db username | `string` | n/a | yes |
| <a name="input_domain_name"></a> [domain\_name](#input\_domain\_name) | The domain name for the certificate | `string` | n/a | yes |
| <a name="input_instance_key_name"></a> [instance\_key\_name](#input\_instance\_key\_name) | Name of the instance key pair | `string` | n/a | yes |
| <a name="input_instance_name"></a> [instance\_name](#input\_instance\_name) | Name of the AWS instance | `string` | n/a | yes |
| <a name="input_k8s_namespace"></a> [k8s\_namespace](#input\_k8s\_namespace) | k8s deployment namespace | `string` | n/a | yes |
| <a name="input_k8s_pv_name"></a> [k8s\_pv\_name](#input\_k8s\_pv\_name) | k8s pv wordpress name | `string` | n/a | yes |
| <a name="input_k8s_pvc_name"></a> [k8s\_pvc\_name](#input\_k8s\_pvc\_name) | k8s pvc name | `string` | n/a | yes |
| <a name="input_k8s_storage_class_name"></a> [k8s\_storage\_class\_name](#input\_k8s\_storage\_class\_name) | storage class name | `string` | n/a | yes |
| <a name="input_kms_alias_name"></a> [kms\_alias\_name](#input\_kms\_alias\_name) | Alias for the kms key | `string` | n/a | yes |
| <a name="input_public_ip"></a> [public\_ip](#input\_public\_ip) | n/a | `string` | n/a | yes |
| <a name="input_vpc_name"></a> [vpc\_name](#input\_vpc\_name) | vpc\_name | `string` | n/a | yes |
| <a name="input_wordpress_admin_password"></a> [wordpress\_admin\_password](#input\_wordpress\_admin\_password) | ## helm vars wordpress helm release | `string` | n/a | yes |

## Outputs

No outputs.
