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
| [helm_release.external_dns](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_deployment_region"></a> [deployment\_region](#input\_deployment\_region) | region to deploy into | `string` | n/a | yes |
| <a name="input_k8s_namespace"></a> [k8s\_namespace](#input\_k8s\_namespace) | napaspace to deploy into | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_release_name"></a> [release\_name](#output\_release\_name) | n/a |
| <a name="output_service_account_name"></a> [service\_account\_name](#output\_service\_account\_name) | n/a |
