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

variable "business_domain" {
  description = "Bucket list for business folders"
  type        = string
}

variable "trigger_emails"{
  description = "Business email"
   type        = list(string)
}

variable "lambda_function" {
  description = "Function name"
  type        = string
}

variable "rule_set" {
  description = "Rule set to attach"
  type        = string
}

variable "rule_trigger_name" {
  description = "Rule trigger name"
  type        = string
}

variable "trigger_tls_policy" {
  description = "TLS policy"
  type        = string
}

variable "lambda_invocation_type" {
  description = "Lambda invocation type"
  type        = string
}

variable "lambda_position" {
  description = "Lambda position"
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
