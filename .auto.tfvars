### AWS resources
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
#ACM
domain_name = "interviewtest.com"
#KMS
kms_alias_name = "alias/wordpress"

###k k8s vars
# k8s ns
k8s_namespace = "wordpress"
# k8s storage
k8s_storage_class_name = "wordpress-storage-class"
k8s_pv_name = "wordpress-ebs-pv"
k8s_pvc_name = "wordpress-ebs-pvc"