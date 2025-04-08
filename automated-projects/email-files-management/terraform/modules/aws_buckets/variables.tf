
# environment
variable "environment" {
  description = "Environment of deployment"
  type        = string
}

# buckets
variable "business_buckets"{
  description = "List of business buckets"
  type        = list(string)
}