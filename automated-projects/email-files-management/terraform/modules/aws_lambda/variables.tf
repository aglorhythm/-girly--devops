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

variable "role_arn" {
  description = "Role arn to associate with the lambda function"
  type        = string
}

variable "lambda_source_file" {
  description = "Lambda source path for script to use"
  type        = string
}

variable "lambda_output_path" {
  description = "Lambda output path"
  type        = string
}

variable "runtime" {
  description = "Lambda runtime"
  type        = string
}

variable "lambda_function_name"{
  description = "AWS Token"
  type        = string
}

variable "handler_location"{
  description = "Handle path"
  type        = string
}




