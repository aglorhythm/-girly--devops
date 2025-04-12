# ===================================
# Author: @aglorhythm
# Description: Creates SES service
# ===================================

data "aws_caller_identity" "current" {}
data "aws_lambda_function" "dev_store_files" {
  function_name = "${var.environment}-efm-store-files"
}

# add domain identity
resource "aws_ses_domain_identity" "efm" {
  domain = var.business_email
}

# enable trust with dkim
resource "aws_ses_domain_dkim" "dkim" {
  domain = aws_ses_domain_identity.efm.domain
}

# receipt rules set
resource "aws_ses_receipt_rule_set" "efm_main" {
  rule_set_name = "${var.environment}-efm-rule-set"
}

# trigger lambda when email is received by specific senders
resource "aws_ses_receipt_rule" "trigger_lambda" {
  name          = "${var.environment}-store-files"
  rule_set_name = aws_ses_receipt_rule_set.dev_efm_main.rule_set_name
  recipients    = var.trigger_emails
  enabled       = true
  scan_enabled  = true
  tls_policy    = "Optional"

  lambda_action {
      function_arn = data.aws_lambda_function.dev_store_files.arn
      invocation_type = "Event"
      position = 0
  }

  depends_on = [aws_lambda_permission.dev_allow_ses]
}

# Lambda permission
resource "aws_lambda_permission" "allow_ses" {
  statement_id  = "AllowExecutionFromSES"
  action        = "lambda:InvokeFunction"
  function_name = data.aws_lambda_function.dev_store_files.function_name
  principal     = "ses.amazonaws.com"
  source_arn    = "arn:aws:ses:${var.aws_region}:${data.aws_caller_identity.current.account_id}:receipt-rule/${aws_ses_receipt_rule_set.dev_efm_main.rule_set_name}"
}
