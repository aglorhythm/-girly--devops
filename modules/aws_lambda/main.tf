# ===================================
# Author: @aglorhythm
# Description: Creates Lambda function
# ===================================

data "aws_caller_identity" "current" {}



# archive func
data "archive_file" "lambda"{
  type  = "zip"
  source_file = "${path.module}/${var.python_script_folder}/store_files.py"
  output_path = "lambda_func_src.zip"
}

resource "aws_lambda_function" "lambda" {
  filename      = "lambda_func_src.zip"
  function_name = "${var.environment}_python_efm_store_files"
  role          = var.role_arn

  source_code_hash = data.archive_file.lambda.output_base64sha256

  runtime = "python3.11"
  handler = "lambda_handler"

  # environment {
  #   variables = {
  #     foo = "toedit"
  #   }
  # }
}