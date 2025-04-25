output "account_id" {
  value = data.aws_caller_identity.current.account_id
}

output "ses_verification_txt_record" {
  value = {
    name   = "_amazonses.${aws_ses_domain_identity.project_identity.domain}"
    type   = "TXT"
    value  = aws_ses_domain_identity.project_identity.verification_token
    ttl    = 600
  }
}

output "ses_domain_token" {
  value = aws_ses_domain_identity.project_identity.verification_token
}