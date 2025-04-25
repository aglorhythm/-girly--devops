# ===================================
# Author: @aglorhythm
# Description: Creates Iam role
# ===================================
data "aws_caller_identity" "current" {}

# create iam role
resource "aws_iam_role" "default" {
  name = var.role_name
  assume_role_policy = var.assume_role_policy_tpl
}

# create iam policy
resource "aws_iam_policy" "default" {
  name   = var.policy_name
  policy = var.policy_tpl
}

# attach policy to role
resource "aws_iam_role_policy_attachment" "lambda_policy_attachment" {
  role       = aws_iam_role.default.name
  policy_arn = aws_iam_policy.default.arn
}