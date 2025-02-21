# ===================================
# Author: @aglorhythm / girlysheet.cloud ✿
# Description: Here we define our variables. They can be used dynamically !
# ===================================

# VPC ID where the security group will be created
variable "vpc_id" {
  type        = string
  description = "The ID of the VPC where the security group will be created."
}

# CIDR blocks to allow SSH access
variable "ssh_access_cidr" {
  type        = list(string)
  description = "List of CIDR blocks that are allowed SSH access to the instances."
  default     = ["0.0.0.0/0"]  # Be cautious with a default allowing wide access; specific entries are recommended.
}
