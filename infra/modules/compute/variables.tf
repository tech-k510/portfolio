variable "vpc_id" {
  description = "VPCのID"
  type        = string
}

variable "subnet_id" {
  description = "サブネットID"
  type        = string
}

variable "ami_id" {
  description = "AMI ID"
  type        = string
}

variable "instance_type" {
  description = "インスタンスタイプ"
  type        = string
}

variable "allowed_ip" {
  description = "外部IPからのHTTPリクエストを許可するIP"
  type        = string
}

variable "security_group_id" {
  description = "The security group ID"
  type        = string
}