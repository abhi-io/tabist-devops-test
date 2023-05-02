


module "network_vpc" {
  source = "./modules/vpc"

  app_name = var.app_name
  cidr     = var.cidr
  tags     = var.tags
}

module "security_group" {
  source        = "./modules/security_group"
  app_name      = var.app_name
  vpc_id        = module.network_vpc.vpc_id
  ingress_ports = var.open_ingress_ports
  tags          = var.tags
}

module "ec2" {
  source                 = "./modules/ec2"
  app_name               = var.app_name
  vpc_id                 = module.network_vpc.vpc_id
  vpc_security_group_ids = module.security_group.ingress_security_group_id
  public_subnets_ids     = module.network_vpc.public_subnets
  ami                    = "ami-03a933af70fa97ad2"
  tags                   = var.tags
}