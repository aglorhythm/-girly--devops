# ===================================
# Author: @aglorhythm
# Description: Variables for lambda module
# ===================================


# ====
# COMMON
# ====

# environment
variable "environment" {
  description = "Environment of deployment"
  type        = string
}

variable "python_script_folder"{
  description = "Python script folder"
   type        = string
}

variable "role_arn" {
  description = "Role arn to associate with the lambda function"
   type        = string
}

