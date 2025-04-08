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

# buckets
variable "business_buckets" {
  description = "Bucket list for business folders"
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

variable "aws_access_key_id"{
  description = "AWS Access Key"
  type        = string
}

variable "aws_secret_access_key"{
  description = "AWS Secret Key"
  type        = string
}

variable "aws_session_token"{
  description = "AWS Token"
  type        = string
}