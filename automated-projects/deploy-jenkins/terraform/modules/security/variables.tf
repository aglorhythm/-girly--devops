# ===================================
# Author: @aglorhythm / girlysheet.cloud ✿
# Description: Here we define our variables. They can be used dynamically !
# ===================================

# VPC ID where the security group will be created
variable "vpc_id" {
  type        = string
  description = "The ID of the VPC where the security group will be created."
  default     = "vpc-0d057a55e7745e1ca"
}

# Security groups
variable "sg" {
  type        = list(string)
  description = "List of security groups."
  default     = ["jenkins_sg"] # Focus on Paris & London 
}


# CIDR blocks to allow SSH access
variable "ssh_access_cidr" {
  type        = string
  description = "CIDR blocks that is allowed SSH access to the instances."
  default     = "0.0.0.0/0"  # Be cautious with a default allowing wide access; specific entries are recommended.
}
