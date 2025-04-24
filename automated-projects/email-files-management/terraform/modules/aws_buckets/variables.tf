
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
