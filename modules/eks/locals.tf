locals {
  cluster_name              = "jamf_eks_cluster"
  cluster_version           = "1.32"
  es_desire_node_count      = 1
  es_min_node_count         = 1
  es_max_node_count         = 3
  es_instance_types         = ["t3.micro"]
  default_desire_node_count = 1
  default_max_node_count    = 3
  default_min_node_count    = 1
  default_instance_types    = ["t3.micro"]
}
