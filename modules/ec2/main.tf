module "ec2_cluster" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 2.0"

  name = var.app_name
    instance_count         = length(var.public_subnets_ids)
  # instance_count              = 1
  ami                         = var.ami
  instance_type               = "t3a.medium"
  monitoring                  = false
  associate_public_ip_address = true
  vpc_security_group_ids      = [var.vpc_security_group_ids]
  subnet_ids                  = var.public_subnets_ids
  user_data                   = <<-EOT
    #!/bin/bash
    apt get update; apt install -y nginx;
  EOT
  tags                        = var.tags
}