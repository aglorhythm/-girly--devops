# ===================================
# Author: @aglorhythm
# Description: Variables for iam module
# ===================================

# ====
# COMMON
# ====

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

variable "policy_tpl" {
    description   = "Policy name"
    type          = string
}

variable "assume_role_policy_tpl" {
    description   = "Policy name"
    type          = string
}