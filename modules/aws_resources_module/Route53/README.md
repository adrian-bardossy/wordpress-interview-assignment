## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_route53_record.a_record](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_route53_zone.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_zone) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_a_record_alias"></a> [a\_record\_alias](#input\_a\_record\_alias) | ALIAS record config, if using AWS resources | <pre>object({<br/>    name                   = string<br/>    zone_id                = string<br/>    evaluate_target_health = bool<br/>  })</pre> | n/a | yes |
| <a name="input_a_record_values"></a> [a\_record\_values](#input\_a\_record\_values) | List of record values (IP addresses, etc.) | `list(string)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_domain_name"></a> [domain\_name](#output\_domain\_name) | Outputed value of the domain name deploted into the Route53 zone |
| <a name="output_name_servers"></a> [name\_servers](#output\_name\_servers) | List of name servers for the hosted zone |
| <a name="output_zone_id"></a> [zone\_id](#output\_zone\_id) | ID of the hosted zone |
