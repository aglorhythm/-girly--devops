# ===================================
# Author: @aglorhythm
# Description: Creates SES service
# ===================================

data "aws_caller_identity" "current" {}

data "aws_lambda_function" "lambda" {
  function_name = "${var.environment}${var.lambda_function}"
}

# add domain identity
resource "aws_ses_domain_identity" "efm" {
  domain = var.business_domain
}

# enable trust with dkim
resource "aws_ses_domain_dkim" "dkim" {
  domain = aws_ses_domain_identity.efm.domain
}

# receipt rules set

resource "aws_ses_receipt_rule_set" "efm_main" {
  rule_set_name = "${var.environment}-${var.rule_set}"
}

# trigger lambda when email is received by specific recipient
resource "aws_ses_receipt_rule" "trigger" {
  name          = "${var.environment}-${var.rule_trigger_name}"
  rule_set_name = aws_ses_receipt_rule_set.efm_main.rule_set_name
  recipients    = var.trigger_emails
  enabled       = true
  scan_enabled  = true
  tls_policy    = var.trigger_tls_policy

  lambda_action {
      function_arn    = data.aws_lambda_function.lambda.arn
      invocation_type = var.lambda_invocation_type
      position        = var.lambda_position
  }

  depends_on = [aws_lambda_permission.allow_ses]
}

# Lambda permission
resource "aws_lambda_permission" "allow_ses" {
  statement_id  = "AllowExecutionFromSES"
  action        = "lambda:InvokeFunction"
  function_name = data.aws_lambda_function.lambda.function_name
  principal     = "ses.amazonaws.com"
  source_arn    = "arn:aws:ses:${var.aws_region}:${data.aws_caller_identity.current.account_id}:receipt-rule/${aws_ses_receipt_rule_set.efm_main.rule_set_name}"
}
