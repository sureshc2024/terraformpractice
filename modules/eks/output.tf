output "cluster_id" {
  value = aws_eks_cluster.mycluster.id
}

output "cluster_endpoint" {
  value = aws_eks_cluster.mycluster.endpoint
}

output "cluster_arn" {
  value = aws_eks_cluster.mycluster.arn
}
