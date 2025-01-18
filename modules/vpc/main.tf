resource "aws_vpc" "eks_vpc" {
    cidr_block = var.cidr
    enable_dns_hostnames = true
    enable_dns_support = true
    tags = {
        name = var.vpctag
    } 
}

resource "aws_subnet" "eks_vpc_private_subnet" {
    count = 2
    vpc_id = aws_vpc.eks_vpc.id
    cidr_block = element(var.eks_vpc_private_subnet, count.index)
    availability_zone = element(data.aws_availability_zones.available.names, count.index)
    map_customer_owned_ip_on_launch = false
    tags = {
      Name = "eks_vpc_private_subnet_$(count.index)"
    }
  
}

resource "aws_security_group" "eks_vpc_sg" {
    name = var.eks_vpc_sg
    description = "EKS Cluster Security Group"
    vpc_id = aws_vpc.eks_vpc.id
  
}