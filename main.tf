# ===================================
# Author: @aglorhythm
# Description: Main script
# ===================================


# ===================================
#  Storages creation
# ===================================

module "buckets_efm" {
  source           = "./modules/aws_buckets"
  environment      = var.environment
  business_bucket  = var.business_bucket
  business_folders = var.business_folders
}

# ===================================
#  SES setup
# ===================================

module "ses_efm" {
  depends_on        = [module.lambda_efm]
  source            = "./modules/aws_email"
  environment       = var.environment
  business_email    = var.business_email
  aws_region        = var.aws_region
  trigger_emails    = var.trigger_emails
  lambda_function   = "PythonEfmStoreFile"
  rule_set          = "efm-rule-set"
  rule_trigger_name = "store-files"
  tls_policy        = "Optional"
}

# ===================================
#  Iam resources creation
# ===================================

module "iam_efm" {
  source                = "./modules/aws_iam"
  environment           = var.environment
  role_name             = "EfmLambda"
  service_identifier    = ["lambda.amazonaws.com"]
  policy_name           = "EfmLambdaPolicy"
}

# ===================================
#  Lambda function creation
# ===================================

module "lambda_efm" {
  source                = "./modules/aws_lambda"
  environment           = var.environment
  python_script_folder  = var.python_script_folder
  role_arn              = module.iam_efm.role_arn
}




