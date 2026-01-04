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
    value = module.website.public_subnet_id
}
output "private_subnet_ids" {
    value = module.website.private_subnet_ids
}