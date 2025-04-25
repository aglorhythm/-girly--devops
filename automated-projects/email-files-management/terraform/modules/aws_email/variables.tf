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

variable "email_recipients"{
  description = "Business email"
   type        = list(string)
}

variable "lambda_function_name" {
  description = "Function name"
  type        = string
}

variable "principal" {
  description = "Principal for Lambda permission"
  type        = string
}


variable "rule_set_name" {
  description = "Rule set to attach"
  type        = string
}

variable "rule_name" {
  description = "Rule trigger name"
  type        = string
}

variable "trigger_tls_policy" {
  description = "TLS policy"
  type        = string
}

variable "rule_lambda_invocation_type" {
  description = "Lambda invocation type"
  type        = string
}

variable "rule_lambda_position" {
  description = "Lambda position"
  type        = string
}


variable "aws_region" {
  description = "AWS region"
  type        = string
}

