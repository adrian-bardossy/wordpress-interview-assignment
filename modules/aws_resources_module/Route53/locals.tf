locals {
  zone_name     = "jamfinterviewtest.com"
  comment       = "DNS zone for wordpress"
  a_record_name = "wordpress"
  a_record_type = "A"
  a_record_ttl  = 300
}