# ===================================
# Author: @aglorhythm
# Variables
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

# ============
# PROVIDERS
# ===========

# === AWS
variable "aws_region"{
  description = "AWS Region"
  type        = string
}
