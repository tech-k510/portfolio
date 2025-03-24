# EKS Clusterの作成
resource "aws_eks_cluster" "app" {
  name     = var.eks_cluster_name
  role_arn = aws_iam_role.eks_cluster_role.arn
  version  = var.eks_cluster_version

  vpc_config {
    subnet_ids         = var.eks_subnet_ids
    security_group_ids = [aws_security_group.eks_security_group.id]
  }
}

# IAM RoleとPolicyの設定
resource "aws_iam_role" "eks_cluster_role" {
  name = "eks-cluster-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action    = "sts:AssumeRole"
        Principal = {
          Service = "eks.amazonaws.com"
        }
        Effect    = "Allow"
        Sid       = ""
      },
    ]
  })
}

resource "aws_iam_role_policy_attachment" "eks_cluster_policy_attach" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  role       = aws_iam_role.eks_cluster_role.name
}

resource "aws_iam_role_policy_attachment" "cloudwatch_observability_policy_attach" {
  policy_arn = "arn:aws:iam::aws:policy/CloudWatchAgentServerPolicy"
  role       = aws_iam_role.eks_cluster_role.name
}

resource "aws_iam_role_policy_attachment" "cloudwatch_observability_admin_policy_attach" {
  policy_arn = "arn:aws:iam::aws:policy/CloudWatchAgentAdminPolicy"
  role       = aws_iam_role.eks_cluster_role.name
}

# セキュリティグループの作成
resource "aws_security_group" "eks_security_group" {
  name        = "eks-sg"
  vpc_id      = var.vpc_id
  description = "Security group for EKS cluster"
}

# Kubernetes Provider 設定 (EKSクラスタを接続)
provider "kubernetes" {
  host                   = aws_eks_cluster.app.endpoint
  cluster_ca_certificate = base64decode(aws_eks_cluster.app.certificate_authority[0].data)
  token                  = data.aws_eks_cluster_auth.app.token
}

data "aws_eks_cluster_auth" "app" {
  name = aws_eks_cluster.app.name
}
