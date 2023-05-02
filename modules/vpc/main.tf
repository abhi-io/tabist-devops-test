locals {
  vpc_cidr = var.cidr
  azs      = slice(data.aws_availability_zones.available.names, 0, 2)
}
data "aws_availability_zones" "available" {}

module "vpc" {
  source          = "terraform-aws-modules/vpc/aws"
  name            = var.app_name
  cidr            = local.vpc_cidr
  azs             = local.azs
  private_subnets = [for k, v in local.azs : cidrsubnet(local.vpc_cidr, 8, k)]
  public_subnets  = [for k, v in local.azs : cidrsubnet(local.vpc_cidr, 8, k + 4)]

  enable_nat_gateway = true
  enable_vpn_gateway = true

  tags = var.tags
}