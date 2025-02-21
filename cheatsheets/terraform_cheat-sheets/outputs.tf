# ===================================
# Author: @aglorhythm / girlysheet.cloud ✿
# Description: Creating an outputs.tf file is an excellent practice to 
# expose important information about the resources you're managing.
# These variables can be reused in other configuration files.
# ===================================

output "vpc_id" {
  value       = module.vpc.vpc_id
  description = "The ID of the VPC created."
}

output "public_subnet_ids" {
  value       = module.vpc.public_subnet_ids
  description = "List of IDs of public subnets created."
}

output "private_subnet_ids" {
  value       = module.vpc.private_subnet_ids
  description = "List of IDs of private subnets created."
}

output "public_instance_ip" {
  value       = module.ec2.public_instance_ip
  description = "Public IP address of the public EC2 instance."
}

output "security_group_id" {
  value       = module.security.security_group_id
  description = "The ID of the security group"
}