terraform {
  required_providers {
    ovh = {
      source  = "ovh/ovh"
      version = "1.1.0"
    }
  }
}
# ===================================
# Author: @aglorhythm
# Description: Creates SES service
# ===================================

data "aws_caller_identity" "current" {}

data "aws_lambda_function" "lambda" {
  function_name = var.lambda_function_name
}

# add domain identity
resource "aws_ses_domain_identity" "project_identity" {
  domain = var.business_domain
}

# verify domain
resource "ovh_domain_zone_record" "verification" {
  zone     = var.business_domain
  fieldtype = "TXT"
  subdomain = "_amazonses"
  target    = aws_ses_domain_identity.project_identity.verification_token
  ttl       = 600
}

# add dkim records
resource "ovh_domain_zone_record" "dkim" {
  count     = 3
  zone      = var.business_domain
  fieldtype = "CNAME"
  subdomain = "${aws_ses_domain_dkim.project_dkim.dkim_tokens[count.index]}._domainkey.${var.business_domain}"
  target    = "${aws_ses_domain_dkim.project_dkim.dkim_tokens[count.index]}.dkim.amazonses.com"
  ttl       = 600

}

# enable trust with dkim
resource "aws_ses_domain_dkim" "project_dkim" {
  domain = aws_ses_domain_identity.project_identity.domain
}

# define receipt rules set
resource "aws_ses_receipt_rule_set" "default" {
  rule_set_name = var.rule_set_name
}

# active rule set
resource "aws_ses_active_receipt_rule_set" "main" {
  rule_set_name = aws_ses_receipt_rule_set.default.rule_set_name
}

# add lambda trigger - when email is received by specific recipient
resource "aws_ses_receipt_rule" "trigger" {
  depends_on = [
    aws_lambda_permission.allow_ses,
    aws_ses_receipt_rule_set.default
  ]
  name          = var.rule_name
  rule_set_name = aws_ses_receipt_rule_set.default.rule_set_name
  recipients    = var.email_recipients
  enabled       = true
  scan_enabled  = true
  tls_policy    = var.trigger_tls_policy

  lambda_action {
    function_arn    = data.aws_lambda_function.lambda.arn
    invocation_type = var.rule_lambda_invocation_type
    position        = var.rule_lambda_position
  }
}

# give SES a Lambda permission
resource "aws_lambda_permission" "allow_ses" {
  statement_id  = "AllowExecutionFromSES"
  action        = "lambda:InvokeFunction"
  function_name = var.lambda_function_name
  principal     = var.principal
  source_arn    = join(":", [
    "arn",
    "aws",
    "ses",
    var.aws_region,
    data.aws_caller_identity.current.account_id,
    "receipt-rule-set/${var.rule_set_name}",
    "receipt-rule/${var.rule_name}",
  ])
}


