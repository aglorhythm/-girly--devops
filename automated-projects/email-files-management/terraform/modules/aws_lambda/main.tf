# ===================================
# Author: @aglorhythm
# Description: Creates Lambda function
# ===================================

# set up and assume role policy
data "aws_iam_policy_document" "assume_role" {
  statement {
    effect = "Allow"

    principals {
      type         = "Service"
      identifiers  = ["lambda.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}

# Iam role for lambda
resource "aws_iam_role" "iam_for_lambda" {
  name = "iam_for_lambda"
  assume_role_policy = data.aws_iam_policy_document.assume_role.json
}

# archive func
data "archive_file" "lambda"{
  type  = "zip"
  source_file = "${path.module}/${var.python_script_folder}/store_files.py"
  output_path = "lambda_func_src.zip"
}

#
resource "aws_lambda_function" "lambda" {
  filename      = "lambda_func_src.zip"
  function_name = "python_efm_store_files"
  role          = aws_iam_role.iam_for_lambda.arn

  source_code_hash = data.archive_file.lambda.output_base64sha256

  runtime = "python3.11"
  handler = "lambda_handler"

  # environment {
  #   variables = {
  #     foo = "toedit"
  #   }
  # }
}