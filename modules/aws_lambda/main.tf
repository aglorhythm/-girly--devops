# ===================================
# Author: @aglorhythm
# Description: Creates Lambda function
# ===================================

data "aws_caller_identity" "current" {}



# archive func
data "archive_file" "lambda"{
  type  = "zip"
  source_file = var.lambda_source_file
  output_path = "${var.environment}_lambda_func_src_${var.lambda_output_path}.zip"
}


resource "aws_lambda_function" "lambda" {
  filename      = "${var.environment}_lambda_func_src_${var.lambda_output_path}.zip"
  function_name = "${var.environment}PythonEfmStoreFile"
  role          = var.role_arn

  source_code_hash = data.archive_file.lambda.output_base64sha256

  runtime = var.runtime
  handler = "lambda_handler"

  # environment {
  #   variables = {
  #     foo = "toedit"
  #   }
  # }
}