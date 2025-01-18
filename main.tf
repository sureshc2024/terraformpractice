#Provider Information

provider "aws" {
    region = var.region
  
}

# Remote backend configuration]

terraform {
  backend "s3" {
    bucket = var.bucketname
    region = var.region
    encrypt = true
    key = "eks-cluster/terraform.tfstate"
    dynamodb_table = var.dynamodbtable
    
  }
}

module "vpc" {
    source = "module/vpc"
  
}

module "iam" {
    source = "module/iam"
  
}

module "eks" {
    source = "module/eks"
    cluster_name = "dev_cluster"
    clustercluster_role_arn = module.iam.eks_cluster.arn
    subnet_ids       = module.vpc.eks_private_subnet_ids
    node_group_name  = "dev-node-group"
    node_role_arn    = module.iam.eks_node.arn
    node_desired_size = 2
    node_min_size     = 1
    node_max_size     = 3
    instance_types    = ["t2.medium"]
    kms_key_arn       = "arn:aws:kms:us-west-2:123456789012:key/your-key-id"
}