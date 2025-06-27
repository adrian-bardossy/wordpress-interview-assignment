## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_kubernetes"></a> [kubernetes](#provider\_kubernetes) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [kubernetes_persistent_volume.wordpress_ebs_pv](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/persistent_volume) | resource |
| [kubernetes_persistent_volume_claim.wordpress_ebs_pvc](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/persistent_volume_claim) | resource |
| [kubernetes_storage_class_v1.wordpress_storage_class](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/storage_class_v1) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_ebs_volume_id"></a> [ebs\_volume\_id](#input\_ebs\_volume\_id) | PV storage class AWS EBS volume | `string` | n/a | yes |
| <a name="input_k8s_namespace"></a> [k8s\_namespace](#input\_k8s\_namespace) | Namespace of wordpress app in cluster | `string` | n/a | yes |
| <a name="input_k8s_pv_name"></a> [k8s\_pv\_name](#input\_k8s\_pv\_name) | k8s pv wordpress name | `string` | n/a | yes |
| <a name="input_k8s_pvc_name"></a> [k8s\_pvc\_name](#input\_k8s\_pvc\_name) | k8s pvc name | `string` | n/a | yes |
| <a name="input_k8s_storage_class_name"></a> [k8s\_storage\_class\_name](#input\_k8s\_storage\_class\_name) | storage class name | `string` | n/a | yes |

## Outputs

No outputs.
