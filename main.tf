module "website" {
  source = "./website"
  app_name = var.server_name_root
  aws_region = var.aws_region
  vpc_id = module.website.vpc_id
  subnet_ids = [
  module.website.public_subnet_id,
  module.website.private_subnet_ids[0],
  module.website.private_subnet_ids[1]
  ]
}