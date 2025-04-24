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
  depends_on                = [module.iam_efm, module.lambda_efm]
  source                    = "./modules/aws_email"
  environment               = var.environment
  business_domain            = var.business_domain
  aws_region                = var.aws_region
  trigger_emails            = var.trigger_emails
  lambda_function           = "PythonEfmStoreFile"
  rule_set                  = "efm-rule-set"
  rule_trigger_name         = "store-files"
  trigger_tls_policy        = "Optional"
  lambda_invocation_type    = "Event"
  lambda_position           = 0
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
  depends_on            = [module.iam_efm]
  source                = "./modules/aws_lambda"
  environment           = var.environment
  python_script_folder  = var.python_script_folder
  role_arn              = module.iam_efm.role_arn
  lambda_source_file    = "${path.module}/../python/store_files.py"
  lambda_output_path    = "efm"
  runtime               = "python3.11"
  function_name         = "${var.environment}PythonEfmStoreFile"
  handler_location       = "store_files"
}


