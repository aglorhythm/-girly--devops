# ===================================
# Author: @aglorhythm / girlysheet.cloud ✿
# Description: Creating an outputs.tf file is an excellent practice to 
# expose important information about the resources you're managing.
# These variables can be reused in other configuration files.
# ===================================

# ✿ Output the ID of the VPC
output "vpc_id" {
  value       = aws_vpc.jenkins_vpc.id
  description = "The ID of the VPC created."
}

# ✿ Output the CIDR block of the VPC
output "vpc_cidr_block" {
  value       = aws_vpc.jenkins_vpc.cidr_block
  description = "The CIDR block of the VPC."
}

# ✿ Output the list of public subnet IDs
output "public_subnet_ids" {
  value       = aws_subnet.public_subnets[*].id
  description = "The IDs of the public subnets created in the VPC."
}

# ✿ Output the Internet Gateway ID
output "internet_gateway_id" {
  value       = aws_internet_gateway.jenkins_gw.id
  description = "The ID of the Internet Gateway attached to the VPC."
}
