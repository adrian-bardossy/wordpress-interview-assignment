aws_region = "eu-south-1"
## aws module
vpc_name = "jamf_vpc"
#rds
db_username = "wordpress"
db_password = "MyPasswordToRDS"
#bastion
instance_name = "jamf-bastion-instance"
instance_key_name = "jamf-bastion-kp"
public_ip = "85.193.39.230/32"
#Route53
a_record_alias = null
a_record_values = []