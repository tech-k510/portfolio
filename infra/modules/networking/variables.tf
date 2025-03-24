variable "cidr_block" {
  description = "VPCのCIDRブロック"
  type        = string
}

variable "subnet_cidr" {
  description = "サブネットのCIDRブロック"
  type        = string
}

variable "subnet_cidr_1" {
  description = "サブネットのCIDRブロック"
  type        = string
}

variable "subnet_cidr_2" {
  description = "サブネットのCIDRブロック"
  type        = string
}


variable "availability_zone" {
  description = "利用するアベイラビリティゾーン"
  type        = string
}

variable "availability_zone_1" {
  description = "利用するアベイラビリティゾーン"
  type        = string
}

variable "availability_zone_2" {
  description = "利用するアベイラビリティゾーン"
  type        = string
}
