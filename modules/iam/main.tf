resource "aws_iam_role" "eks_cluster_role" {
    name = var.eks-cluster-role
    assume_role_policy = data.aws_iam_policy_document.eks_cluster_assume_role_policy.json
  
}

data "aws_iam_policy_document" "eks_cluster_assume_role_policy" {
    statement {
      actions = ["sts:AssumeRole"]
      principals {
        type = "Service"
        identifiers = ["eks.amazonaws.com"]
      }
    }
  
}

resource "aws_iam_role_policy_attachment" "eks_cluster_attachment" {
  role       = aws_iam_role.eks_cluster_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
}

resource "aws_iam_role" "eks_node_role" {
    name = var.eks-node-role
    assume_role_policy = data.aws_iam_policy_document.eks_node_assume_role_policy.json
}

data "aws_iam_policy_document" "eks_node_assume_role_policy" {
    statement {
        actions = ["sts:AssumeRole"]
        principals {
          type = "Service"
          identifiers = ["ec2.amazonaws.com"]
        }
      
    }
  
}
resource "aws_iam_role_policy_attachment" "eks_node_attachment" {
    role       = aws_iam_role.eks_node_role.name
    policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
}

resource "aws_iam_role_policy_attachment" "eks_node_attachment_autoscaler" {
    role       = aws_iam_role.eks_node_role.name
    policy_arn = "arn:aws:iam::aws:policy/AmazonEC2AutoScalingFullAccess"
}