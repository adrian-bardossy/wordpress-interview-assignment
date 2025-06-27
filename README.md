## Module Descriptions
### AWS Resources Modules
#### VPC
- Creates the VPC, public and private subnets, route tables, NAT gateways, and all networking resources required for the cluster and other AWS components.
#### EKS
- Provisions the managed Amazon EKS Kubernetes cluster with node groups, including worker nodes, taints, Fargate profiles, and necessary IAM roles.
#### RDS
- Deploys the MariaDB instance with proper subnet groups, security groups, and storage options for persistent data storage for WordPress.
#### EBS
- Manages dedicated EBS volumes used as persistent storage for Kubernetes PVs (PersistentVolumes).
#### KMS
- Creates an AWS KMS key with alias and rotation enabled for encryption of sensitive secrets like database passwords.
#### Secret_Manager
- Stores sensitive data such as database credentials and certificate secrets in AWS Secrets Manager for centralized secret management.
#### Route53
- Manages the DNS hosted zone and related DNS records for the application domain to enable external access and certificate validation.
#### bastion
- Provisions a bastion host with SSH access limited to your public IP access for secure jumpbox access into the private network within the created VPC and to access the resources - rds database, ebs volume, private subnet in eks

### Kubernetes Resources Modules
#### k8s_namespace
-  Creates the dedicated Kubernetes namespace to isolate WordPress and related components.
#### k8s_storage
-  Defines the StorageClass, PersistentVolume (PV), and PersistentVolumeClaim (PVC) backed by AWS EBS for WordPress data storage.
#### k8s_secrets
-  Creates Kubernetes Secrets with encrypted database passwords and other credentials for use by WordPress pods.

### Helm Chart Modules
#### cert-manager
-  Installs and configures the cert-manager Helm chart to automate TLS certificate management inside the cluster, integrating with Route53 for DNS validation.
#### external-dns
-  Deploys external-dns Helm chart to automatically manage DNS records in Route53 based on Kubernetes Ingress and Service resources.
#### ingress_nginx
- Installs the NGINX ingress controller via Helm, configured for AWS NLB to expose HTTP/HTTPS ingress endpoints.
- Exposes port 80 to publicly accessible port 8080
- Exposes port 443 to publicly accessible port 8443
#### wordpress
-  Deploys the WordPress Helm chart with full configuration for external database connectivity, TLS termination, ingress routing, autoscaling, and pod affinity.

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 5.79 |
| <a name="requirement_helm"></a> [helm](#requirement\_helm) | ~> 2.8 |
| <a name="requirement_kubernetes"></a> [kubernetes](#requirement\_kubernetes) | ~> 2.23 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.100.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_EBS"></a> [EBS](#module\_EBS) | ./modules/aws_resources_module/EBS | n/a |
| <a name="module_KMS"></a> [KMS](#module\_KMS) | ./modules/aws_resources_module/KMS | n/a |
| <a name="module_RDS"></a> [RDS](#module\_RDS) | ./modules/aws_resources_module/rds | n/a |
| <a name="module_Route53"></a> [Route53](#module\_Route53) | ./modules/aws_resources_module/Route53 | n/a |
| <a name="module_Secret_Manager"></a> [Secret\_Manager](#module\_Secret\_Manager) | ./modules/aws_resources_module/Secret_Manager | n/a |
| <a name="module_VPC"></a> [VPC](#module\_VPC) | ./modules/aws_resources_module/vpc | n/a |
| <a name="module_bastion"></a> [bastion](#module\_bastion) | ./modules/aws_resources_module/bastion | n/a |
| <a name="module_cert-manager"></a> [cert-manager](#module\_cert-manager) | ./modules/helm_wordpress_release_module/cert-manager | n/a |
| <a name="module_eks"></a> [eks](#module\_eks) | ./modules/aws_resources_module/eks | n/a |
| <a name="module_external-dns"></a> [external-dns](#module\_external-dns) | ./modules/helm_wordpress_release_module/external-dns | n/a |
| <a name="module_ingress_nginx"></a> [ingress\_nginx](#module\_ingress\_nginx) | ./modules/helm_wordpress_release_module/ingress | n/a |
| <a name="module_k8s_namespace"></a> [k8s\_namespace](#module\_k8s\_namespace) | ./modules/k8s_resources_module/k8s_namespace | n/a |
| <a name="module_k8s_secrets"></a> [k8s\_secrets](#module\_k8s\_secrets) | ./modules/k8s_resources_module/k8s_secrets | n/a |
| <a name="module_k8s_storage"></a> [k8s\_storage](#module\_k8s\_storage) | ./modules/k8s_resources_module/k8s_storage | n/a |
| <a name="module_wordpress"></a> [wordpress](#module\_wordpress) | ./modules/helm_wordpress_release_module/wordpress | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_eks_cluster_auth.token](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/eks_cluster_auth) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_a_record_alias"></a> [a\_record\_alias](#input\_a\_record\_alias) | ALIAS record config used for Route53 | <pre>object({<br/>    name                   = string<br/>    zone_id                = string<br/>    evaluate_target_health = bool<br/>  })</pre> | `null` | no |
| <a name="input_a_record_values"></a> [a\_record\_values](#input\_a\_record\_values) | List of record values (IP addresses, etc.) | `list(string)` | `[]` | no |
| <a name="input_aws_region"></a> [aws\_region](#input\_aws\_region) | Region to deploy the aws resources into | `string` | n/a | yes |
| <a name="input_db_password"></a> [db\_password](#input\_db\_password) | MariaDB database password | `string` | n/a | yes |
| <a name="input_db_username"></a> [db\_username](#input\_db\_username) | Name of the db user | `string` | n/a | yes |
| <a name="input_domain_name"></a> [domain\_name](#input\_domain\_name) | Domain name used for route53 deployment | `string` | n/a | yes |
| <a name="input_instance_key_name"></a> [instance\_key\_name](#input\_instance\_key\_name) | Name of the instance key pair | `string` | n/a | yes |
| <a name="input_instance_name"></a> [instance\_name](#input\_instance\_name) | Name of the AWS instance | `string` | n/a | yes |
| <a name="input_k8s_namespace"></a> [k8s\_namespace](#input\_k8s\_namespace) | k8s deployment namespace for the wordpress aplication deployment | `string` | n/a | yes |
| <a name="input_k8s_pv_name"></a> [k8s\_pv\_name](#input\_k8s\_pv\_name) | k8s persistent volume  wordpress name | `string` | n/a | yes |
| <a name="input_k8s_pvc_name"></a> [k8s\_pvc\_name](#input\_k8s\_pvc\_name) | k8s persistent volume claim name | `string` | n/a | yes |
| <a name="input_k8s_storage_class_name"></a> [k8s\_storage\_class\_name](#input\_k8s\_storage\_class\_name) | storage class name to use for the deployment | `string` | n/a | yes |
| <a name="input_kms_alias_name"></a> [kms\_alias\_name](#input\_kms\_alias\_name) | Alias for the kms key | `string` | n/a | yes |
| <a name="input_public_ip"></a> [public\_ip](#input\_public\_ip) | Definition of your public IP to be able to access the bastion instance from | `string` | n/a | yes |
| <a name="input_vpc_name"></a> [vpc\_name](#input\_vpc\_name) | Name of the vpc | `string` | n/a | yes |
| <a name="input_wordpress_admin_password"></a> [wordpress\_admin\_password](#input\_wordpress\_admin\_password) | Wordpress admin password to access the admin GUI | `string` | n/a | yes |

## Outputs

No outputs.
