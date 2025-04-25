output "role_arn" {
  value = aws_iam_role.default.arn
}

output "policy_arn" {
  value = aws_iam_policy.default.arn
}

output "policy_name" {
  value = aws_iam_policy.default.name
}