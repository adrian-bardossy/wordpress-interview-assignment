## Requirements

No requirements.

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_wordpress_admin_password"></a> [wordpress\_admin\_password](#module\_wordpress\_admin\_password) | terraform-aws-modules/secrets-manager/aws | 1.3.1 |
| <a name="module_wordpress_db_password"></a> [wordpress\_db\_password](#module\_wordpress\_db\_password) | terraform-aws-modules/secrets-manager/aws | 1.3.1 |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_admin_password"></a> [admin\_password](#input\_admin\_password) | n/a | `string` | `"Wordpress admin gui password"` | no |
| <a name="input_database_password"></a> [database\_password](#input\_database\_password) | Database password input | `string` | n/a | yes |

## Outputs

No outputs.
