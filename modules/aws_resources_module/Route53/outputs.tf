output "zone_id" {
  description = "ID of the hosted zone"
  value       = aws_route53_zone.this.zone_id
}

output "name_servers" {
  description = "List of name servers for the hosted zone"
  value       = aws_route53_zone.this.name_servers
}

output "domain_name" {
  value = local.zone_name
  description = "Outputed value of the domain name deploted into the Route53 zone"
}
