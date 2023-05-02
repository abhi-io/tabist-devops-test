output "vpc_cidr_block" {
  description = "The CIDR block of the VPC"
  value       = module.network_vpc.vpc_cidr_block
}
output "public_subnets" {
  description = "List of IDs of public subnets"
  value       = module.network_vpc.public_subnets
}
output "public_subnets_cidr_blocks" {
  description = "List of cidr_blocks of public subnets"
  value       = module.network_vpc.public_subnets_cidr_blocks
}
output "default_security_group_id" {
  description = "The ID of the security group created by default on VPC creation"
  value       = module.network_vpc.default_security_group_id
}

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