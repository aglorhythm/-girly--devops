# ===================================
# Author: @aglorhythm
# Creates SES service
# ===================================

data "aws_caller_identity" "current" {}

# add domain identity
resource "aws_ses_domain_identity" "efm" {
  domain = var.business_email
}

# trust
resource "aws_ses_domain_dkim" "dev_dkim" {
  domain = aws_ses_domain_identity.domain.domain
}

# rules
resource "aws_ses_receipt_rule_set" "dev_efm_main" {
  rule_set_name = "${var.environment}-efm-rule-set"
}

# SES rule
resource "aws_ses_receipt_rule" "dev_trigger_lambda" {
  name          = "store-files"
  rule_set_name = aws_ses_receipt_rule_set.dev_efm_main.rule_set_name
  recipients    = ["help@famousinvogue.com"]
  enabled       = true
  scan_enabled  = true
  tls_policy    = "Optional"

  lambda_action {
      function_arn = aws_lambda_function.email_handler.arn
      invocation_type = "Event"
      position = 0
  }

  depends_on = [aws_lambda_permission.allow_ses]
}

# Lambda permission
resource "aws_lambda_permission" "dev_allow_ses" {
  statement_id  = "AllowExecutionFromSES"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.email_handler.function_name
  principal     = "ses.amazonaws.com"
  source_arn    = "arn:aws:ses:${var.aws_region}:${data.aws_caller_identity.current.account_id}:receipt-rule/fiv-rule-set"
}
