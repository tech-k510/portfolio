variable "instance_type" {
  description = "EC2インスタンスタイプ"
  type        = string
  default     = "t2.micro"
}

variable "allowed_ip" {
  description = "許可する外部IPアドレス"
  type        = string
  default     = "116.65.132.148/32"
}

variable "cidr_block" {
  description = "VPCのCIDRブロック"
  type        = string
  default     = "10.0.0.0/16"
}

variable "subnet_cidr" {
  description = "サブネットのCIDRブロック"
  type        = string
  default     = "10.0.1.0/24"
}

variable "subnet_cidr_1" {
  description = "サブネットのCIDRブロック"
  type        = string
  default     = "10.0.2.0/24"
}

variable "subnet_cidr_2" {
  description = "サブネットのCIDRブロック"
  type        = string
  default     = "10.0.3.0/24"
}

variable "availability_zone" {
  description = "利用するアベイラビリティゾーン"
  type        = string
  default     = "ap-northeast-1a"
}

variable "availability_zone_1" {
  description = "利用するアベイラビリティゾーン"
  type        = string
  default     = "ap-northeast-1a"
}

variable "availability_zone_2" {
  description = "利用するアベイラビリティゾーン"
  type        = string
  default     = "ap-northeast-1b"
}

variable "ami_id" {
  description = "AMI ID"
  type        = string
  default     = "ami-0c55b159cbfafe1f0" 
}

variable "eks_cluster_name" {
  description = "eks_cluster_name"
  type        = string
}

variable "eks_cluster_version" {
  description = "eks_cluster_version"
  type        = string
}
