variable "a_record_alias" {
  description = "ALIAS record config, if using AWS resources"
  type = object({
    name                   = string
    zone_id                = string
    evaluate_target_health = bool
  })
}

variable "a_record_values" {
  description = "List of record values (IP addresses, etc.)"
  type        = list(string)
}
