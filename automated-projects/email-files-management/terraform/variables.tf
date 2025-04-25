# ===================================
# Author: @aglorhythm
# Description: Variables for main script
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
variable "business_folders" {
  description = "Folders list for business folders"
  type        = list(string)
}

variable "business_bucket" {
  description = "Bucket list for business folders"
  type        = string
}

variable "business_domain"{
  description = "Business email"
  type        = string
}

variable "trigger_emails"{
  description = "Trigger emails list"
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

# === OVH
variable "ovh_app_secret"{
  description = "OVH application secret"
  type        = string
}

variable "ovh_app_key"{
  description = "OVH application key"
  type        = string
}

variable "ovh_consumer_key"{
  description = "OVH consumer key"
  type        = string
}


