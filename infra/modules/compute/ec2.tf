resource "aws_instance" "app_server" {
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = var.subnet_id
  key_name = "eks"
  vpc_security_group_ids = [var.security_group_id]  # セキュリティグループIDを使用

  associate_public_ip_address = true

  tags = {
    Name = "jump-server"
  }
}

output "instance_public_ip" {
  value = aws_instance.app_server.public_ip  
}