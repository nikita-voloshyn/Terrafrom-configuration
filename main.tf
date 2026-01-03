module "website" {
  source = "./website"
  app_name = var.server_name_root
  aws_region = var.aws_region
}