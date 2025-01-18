resource "aws_eks_cluster" "mycluster" {
    name = var.cluster_name
    role_arn = var.cluster_role_arn
    vpc_config {
      subnet_ids = var.subnet_ids
      endpoint_private_access = true
      endpoint_public_access = false

    }
    encryption_config {
      provider {
        key_arn = var.kms_key_arn

      }
      resources = ["secrets"]
    }
  
}

resource "aws_eks_node_group" "clusternodegroup" {
    cluster_name = aws_eks_cluster.mycluster.name
    node_group_name = var.node_group_name
    node_role_arn = var.node_role_arn
    subnet_ids = var.subnet_ids
    scaling_config {
      desired_size = var.node_desired_size
      min_size = var.node_min_size
      max_size = var.node_max_size
    }
    instance_types = var.instance_types
    ami_type = "AL2_x86_64"
    capacity_type = "ON_DEMAND"
}