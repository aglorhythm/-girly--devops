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
  business_bucket                = var.business_bucket
  business_folders               = var.business_folders

}

