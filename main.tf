# ===================================
# Author: @aglorhythm
# Main script
# ===================================


# ===================================
#  Storages creation
# ===================================

module "aws_buckets" {
  source                          = "./modules/aws_buckets"
  environment                     = var.environment
  business_buckets                = var.business_buckets

}

