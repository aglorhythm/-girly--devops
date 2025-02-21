# ===================================
# Author: @aglorhythm / girlysheet.cloud ✿
# Description: Here we define our variables. They can be used dynamically !
# ===================================

variable "azs" {
  description = "A list of availability zones in the region"
  type        = list(string)
  default     = ["eu-central-1a", "eu-central-1b", "eu-central-1c"]
}

variable "ssh_access_cidr" {
  description = "CIDR block for SSH access"
  type        = string
  default     = "0.0.0.0/0"
}
