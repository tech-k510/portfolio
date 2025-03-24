resource "aws_launch_template" "app_node_launch_template" {
  name = "app-node-launch-template"

  key_name = "eks"

  # シンプルなシェルスクリプト形式で user_data を渡す
  user_data = base64encode(<<-EOF
    MIME-Version: 1.0
    Content-Type: multipart/mixed; boundary="==BOUNDARY=="

    --==BOUNDARY==
    Content-Type: text/x-shellscript; charset="us-ascii"

    #!/bin/bash
    # CloudWatch Agent をインストール
    sudo yum install -y amazon-cloudwatch-agent

    --==BOUNDARY==--
  EOF
  )

  # 他の設定もここに追加予定
}

resource "aws_eks_node_group" "app_node_group" {
  depends_on = [aws_eks_cluster.app]

  cluster_name    = var.eks_cluster_name
  node_group_name = "app-node-group"
  node_role_arn   = aws_iam_role.eks_node_role.arn
  subnet_ids      = var.eks_subnet_ids

  scaling_config {
    desired_size = 2
    max_size     = 4
    min_size     = 2
  }

  instance_types = ["t3.medium"]

  labels = {
    "Environment" = "Production"
  }

  tags = {
    "Name" = "app-node-group"
  }

  # Launch Template を指定してノードグループを作成
  launch_template {
    id      = aws_launch_template.app_node_launch_template.id
    version = "$Latest"
  }
}