module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "20.9.0"

  cluster_name    = local.cluster_name
  cluster_version = local.cluster_version
  vpc_id          = var.vpc_id
  subnet_ids      = var.subnet_ids

  enable_irsa = true

  eks_managed_node_groups = {
    wordpress_nodes = {
      desired_size   = local.es_desire_node_count
      max_size       = local.es_max_node_count
      min_size       = local.es_min_node_count
      instance_types = local.es_instance_types

      labels = {
        owner    = "Adrian_Interview_EKS"
        nodetype = "wordpress"
      }

      taints = [
        {
          key    = "dedicated"
          value  = "wordpress"
          effect = "NO_SCHEDULE"
        }
      ]
    }

    default_nodes = {
      desired_size   = local.default_desire_node_count
      max_size       = local.default_max_node_count
      min_size       = local.default_min_node_count
      instance_types = local.default_instance_types
    }
  }
}
