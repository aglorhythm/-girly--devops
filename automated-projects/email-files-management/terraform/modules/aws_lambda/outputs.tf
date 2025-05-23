output "account_id" {
  value = data.aws_caller_identity.current.account_id
}
output "lambda_function_name" {
  value = aws_lambda_function.lambda.function_name
}
output "lambda_function_arn" {
  value = aws_lambda_function.lambda.arn
}
