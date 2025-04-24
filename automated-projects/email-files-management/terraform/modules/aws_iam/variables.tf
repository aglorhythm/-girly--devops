# ===================================
# Author: @aglorhythm
# Description: Variables for iam module
# ===================================

# ====
# COMMON
# ====

# environment
variable "environment" {
  description = "Environment of deployment"
  type        = string
}

variable "service_identifier" {
  type = list(string)
}

variable "role_name"{
  description   = "Role name"
   type         = string
}

variable "policy_name" {
    description   = "Policy name"
    type          = string
}