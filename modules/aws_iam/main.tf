# ===================================
# Author: @aglorhythm
# Description: Creates Iam role
# ===================================

data "aws_iam_policy_document" "assume_role" {
  statement {
    effect = "Allow"

    principals {
      type         = "Service"
      identifiers  = var.service_identifier
    }

    actions = ["sts:AssumeRole"]
  }
}

resource "aws_iam_role" "role" {
  name = "${var.environment}${var.role_name}"
  assume_role_policy = data.aws_iam_policy_document.assume_role.json
}

resource "aws_iam_policy" "policy" {
  name   = "${var.environment}${var.policy_name}"
  policy = file("${path.module}/policies/lambdaEfm.json")
}

resource "aws_iam_role_policy_attachment" "lambda_policy_attachment" {
  role       = "${var.environment}${aws_iam_role.role.name}"
  policy_arn = aws_iam_policy.policy.arn
}





