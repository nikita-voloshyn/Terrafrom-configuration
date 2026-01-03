output "server_id" {
  value = module.website.server_id
}

output "server_arn" {
    value = module.website.server_arn
}
output "vpc_id" {
    value = module.website.vpc_id
}
output "subnet_id" {
    value = module.website.subnet_id
}
output "instance_public_ip" {
    value = module.website.instance_public_ip
}