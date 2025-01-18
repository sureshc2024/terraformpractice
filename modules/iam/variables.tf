variable "eks-cluster-role" {
    type = string
    description = "role name for eks cluster"
    default = "eks-cluster-role"
  
}

variable "eks-node-role" {
    type = string
    description = "role ec2 node"
    default = "eks-node-role"
  
}