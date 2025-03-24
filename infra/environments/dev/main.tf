provider "aws" {
  region = "ap-northeast-1"
}

module "networking" {
  source      = "../../modules/networking"
  cidr_block  = var.cidr_block
  subnet_cidr = var.subnet_cidr
  availability_zone = var.availability_zone
  subnet_cidr_1 = var.subnet_cidr_1
  availability_zone_1 = var.availability_zone_1
  subnet_cidr_2 = var.subnet_cidr_2
  availability_zone_2 = var.availability_zone_2
}

module "security" {
  source        = "../../modules/security"
  resource_arn  = "arn:aws:elasticloadbalancing:ap-northeast-1:123456789012:loadbalancer/app/my-load-balancer/50dc6c495c0c9188"
  vpc_id        = module.networking.vpc_id        # networkingモジュールからVPC IDを渡す
  allowed_ip    = var.allowed_ip                   
}

module "compute" {
  source        = "../../modules/compute"
  ami_id        = var.ami_id
  instance_type = var.instance_type
  subnet_id     = module.networking.subnet_id  # networkingモジュールからサブネットIDを取得
  vpc_id        = module.networking.vpc_id     # networkingモジュールからVPC IDを取得
  allowed_ip    = var.allowed_ip
  security_group_id = module.security.security_group_id  # セキュリティグループIDを参照
}

module "eks_cluster" {
  source               = "../../modules/compute/eks"  # モジュールのパス
  eks_cluster_name     = var.eks_cluster_name  # EKSクラスター名
  eks_cluster_version  = var.eks_cluster_version  # EKSクラスターバージョン
  eks_subnet_ids       = [module.networking.subnet_id_1, module.networking.subnet_id_2]  # サブネットIDを渡す
  vpc_id               = module.networking.vpc_id
}