variable "resource_arn" {
  description = "WAF Web ACLを関連付けるリソースのARN"
  type        = string
}

variable "vpc_id" {
  description = "The ID of the VPC"
  type        = string
}

variable "allowed_ip" {
  description = "The allowed IP address"
  type        = string
}