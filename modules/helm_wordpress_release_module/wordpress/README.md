## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_helm"></a> [helm](#provider\_helm) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [helm_release.wordpress](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_certificate_secret_identifier"></a> [certificate\_secret\_identifier](#input\_certificate\_secret\_identifier) | n/a | `string` | n/a | yes |
| <a name="input_db_host"></a> [db\_host](#input\_db\_host) | n/a | `string` | n/a | yes |
| <a name="input_db_name"></a> [db\_name](#input\_db\_name) | n/a | `string` | n/a | yes |
| <a name="input_db_password"></a> [db\_password](#input\_db\_password) | n/a | `string` | n/a | yes |
| <a name="input_db_username"></a> [db\_username](#input\_db\_username) | n/a | `string` | n/a | yes |
| <a name="input_k8s_namespace"></a> [k8s\_namespace](#input\_k8s\_namespace) | n/a | `string` | n/a | yes |
| <a name="input_wordpress_admin_password"></a> [wordpress\_admin\_password](#input\_wordpress\_admin\_password) | n/a | `string` | n/a | yes |

## Outputs

No outputs.
