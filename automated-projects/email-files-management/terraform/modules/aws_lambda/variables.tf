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

variable "business_email" {
  description = "Bucket list for business folders"
  type        = string
}

variable "python_script_folder"{
  description = "Python script folder"
   type        = string
}

# ============
# PROVIDERS
# ===========

# === AWS
variable "aws_region"{
  description = "AWS Region"
  type        = string
}
