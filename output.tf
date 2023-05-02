output "vpc_azs" {
  description = " "
  value       = module.network_vpc.vpc_azs
}

output "from_ports" {
  value = module.security_group.from_ports
}

output "ec2_public_ips" {
  value = module.ec2.ec2_public_ip
}