/*
output "instance_public_ip" {
  value = module.compute.instance_public_ip  # 修正：module.computeからpublic_ipを取得
}
*/

output "vpc_id" {
  value = module.networking.vpc_id
}

output "subnet_id_1" {
  value = module.networking.subnet_id_1
}

output "subnet_id_2" {
  value = module.networking.subnet_id_2
}
