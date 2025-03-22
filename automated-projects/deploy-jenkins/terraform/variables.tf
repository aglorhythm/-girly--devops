# ===================================
# Author: @aglorhythm / girlysheet.cloud ✿
# Description: Here we define our variables. They can be used dynamically !
# ===================================

variable "azs" {
  type        = list(string)
  description = "List of prefered availability zones."
  default     = ["eu-west-3a"] # Focus on Paris 
}

variable "key" {
  type        = string
  description = "SSH key name"
  default     = "aws_jenkins_rsa" # Focus on Paris & London 
}

variable "ssh_access_cidr" {
  description = "CIDR block for SSH access"
  type        = string
  default     = "0.0.0.0/0"
}

variable "ssh_key_path" {
  type        = string
  description = "Path to the SSH key directory"
}


# OVH variables  ------- >

variable "ovh_application_key" {
  description = "OVH API application key"
  type        = string
}

variable "ovh_application_secret" {
  description = "OVH API application secret"
  type        = string
}

variable "ovh_consumer_key" {
  description = "OVH API consumer key"
  type        = string
}

variable "domain_name" {
  description = "The domain name to manage"
  type        = string
}
