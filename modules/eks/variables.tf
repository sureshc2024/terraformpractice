variable "cluster_name" {
  description = "The name of the EKS cluster"
  type        = string
}

variable "cluster_role_arn" {
  description = "The ARN of the EKS cluster IAM role"
  type        = string
}

variable "subnet_ids" {
  description = "List of subnet IDs for the EKS cluster"
  type        = list(string)
}

variable "node_group_name" {
  description = "The name of the EKS node group"
  type        = string
}

variable "node_role_arn" {
  description = "The ARN of the IAM role for the node group"
  type        = string
}

variable "node_desired_size" {
  description = "The desired size of the node group"
  type        = number
}

variable "node_min_size" {
  description = "The minimum size of the node group"
  type        = number
}

variable "node_max_size" {
  description = "The maximum size of the node group"
  type        = number
}

variable "instance_types" {
  description = "List of EC2 instance types for the node group"
  type        = list(string)
}

variable "kms_key_arn" {
    type = string
    description = "kms key for encryption"
  
}