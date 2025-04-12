# ===================================
# Author: @aglorhythm
# Description: Variables for email module
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

variable "trigger_emails"{
  description = "Business email"
   type        = list(string)
}

# ============
# PROVIDERS
# ===========

# === AWS
variable "aws_region"{
  description = "AWS Region"
  type        = string
}
