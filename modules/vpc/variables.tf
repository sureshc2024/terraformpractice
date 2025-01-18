variable "vpctag" {
    type = string
    description = "tag of the vpc"
    default = "eks-vpc"
  
}
variable "cidr" {
    type = string
    description = "cidr range"
    default = "10.0.0.0/16"  # Default CIDR range for VPC
  
}

variable "eks_vpc_private_subnet" {
    type = list(string)
    description = "private subnet ranges"
    default = [ "10.1.0.0/24", "10.2.0.0/24" ] # default subnet range
}

variable "eks_vpc_sg" {
    type = string
    description = "security group name" 
    default = "eks_vpc_sg"
  
}