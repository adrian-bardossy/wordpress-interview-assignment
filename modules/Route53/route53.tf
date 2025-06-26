resource "aws_route53_zone" "this" {
  name    = local.zone_name
  comment = local.comment

  tags = {
    DeployedBy = "Terraform"
  }
}

resource "aws_route53_record" "a_record" {
  count = false ? 1 : 0

  zone_id = aws_route53_zone.this.zone_id
  name    = local.a_record_name
  type    = local.a_record_type
  ttl     = local.a_record_ttl

  dynamic "alias" {
    for_each = var.a_record_alias == null ? [] : [var.a_record_alias]
    content {
      name                   = alias.value.name
      zone_id                = alias.value.zone_id
      evaluate_target_health = alias.value.evaluate_target_health
    }
  }

  records = var.a_record_alias == null ? var.a_record_values : null
}
