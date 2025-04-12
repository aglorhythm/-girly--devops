# ===================================
# Author: @aglorhythm
# Description: Main script
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

module "aws_email" {
  depends_on = [module.aws_lambda]
  source                          = "./modules/aws_email"
  environment                     = var.environment
  business_email                  = var.business_email
  aws_region                      = var.aws_region
}

module "aws_lambda" {
  source                          = "./modules/aws_lambda"
  environment                     = var.environment
}


