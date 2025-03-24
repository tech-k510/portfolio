resource "aws_security_group" "allow_ssh" {
  name        = "allow_ssh"
  description = "Allow ssh inbound traffic from specific IP"
  vpc_id      = var.vpc_id   # モジュール外から渡された VPC ID を使用

  # sshのインバウンドルール
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["116.65.132.148/32"]  # 自宅IP (116.65.132.148) のみ許可
  }

  # アウトバウンドのルール（すべてのIPへのアクセスを許可）
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_ssh"
  }
}

output "security_group_id" {
  value = aws_security_group.allow_ssh.id
}