# ===================================
# Author: @aglorhythm
# Description: Main script
# ===================================

data "aws_caller_identity" "current" {}

locals {
  efm_role  = "${var.environment}EfmLambda"
  efm_policy = "${var.environment}EfmLambdaPolicy"
  aws_ses_service = "ses.amazonaws.com"
  efm_lambda_function_name = "${var.environment}PythonEfmStoreFile"
  efm_rule_set_name = "${var.environment}-efm-organizer"
  efm_lambda_handler = "store_files.lambda_handler"
  aws_lambda_service = "lambda.amazonaws.com"
}

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
#  Iam resources creation
# ===================================


module "iam_efm" {
  source               = "./modules/aws_iam"
  role_name            = local.efm_role
  service_identifier   = ["lambda.amazonaws.com"]
  policy_name          = local.efm_policy
  policy_tpl           = templatefile("./modules/aws_iam/policies/lambda.tpl.json", {
    account_id           = data.aws_caller_identity.current.account_id
    role_name            = local.efm_role
    lambda_function_name = local.efm_lambda_function_name
    aws_region           = var.aws_region
    aws_service          = local.aws_ses_service
    rule_set_name        = local.efm_rule_set_name
  })
  assume_role_policy_tpl = templatefile("./modules/aws_iam/policies/assume_role.tpl.json", {
    account_id           = data.aws_caller_identity.current.account_id
    role_name            = local.efm_role
    aws_service          = local.aws_lambda_service
  })
}


# ===================================
#  Lambda function creation
# ===================================

module "lambda_efm" {
  depends_on            = [module.iam_efm]
  source                = "./modules/aws_lambda"
  environment           = var.environment
  role_arn              = module.iam_efm.role_arn
  lambda_source_file    = "${path.module}/../python/store_files.py"
  lambda_output_path    = "efm"
  runtime               = "python3.11"
  lambda_function_name  = local.efm_lambda_function_name
  handler_location      = local.efm_lambda_handler
}

# ===================================
#  SES setup
# ===================================

module "ses_efm" {
  depends_on                     = [module.iam_efm, module.lambda_efm]
  source                         = "./modules/aws_email"
  environment                    = var.environment
  business_domain                = var.business_domain
  aws_region                     = var.aws_region
  email_recipients               = var.trigger_emails
  lambda_function_name           = local.efm_lambda_function_name
  principal                      = local.aws_ses_service
  rule_set_name                  = local.efm_rule_set_name
  rule_name                      =  "${local.efm_rule_set_name}-rule"
  trigger_tls_policy             = "Optional"
  rule_lambda_invocation_type    = "Event"
  rule_lambda_position           = 0
}

