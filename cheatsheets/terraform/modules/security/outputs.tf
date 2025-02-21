# ===================================
# Author: @aglorhythm / girlysheet.cloud ✿
# Description: Creating an outputs.tf file is an excellent practice to 
# expose important information about the resources you're managing.
# These variables can be reused in other configuration files.
# ===================================

# Output the Security Group ID
output "security_group_id" {
  value       = aws_security_group.my_first_group.id
  description = "The ID of the security group."
}


# ✿ Output the Security Group name
output "security_group_name" {
  value       = aws_security_group.my_first_group.name
  description = "The name of the security group."
}

# ✿ Output the Security Group ARN
output "security_group_arn" {
  value       = aws_security_group.my_first_group.arn
  description = "The ARN of the security group."
}

# ✿ Output details about the ingress rule if needed
output "ssh_ingress_rule" {
  value = {
    from_port   = aws_security_group_rule.allow_ssh.from_port
    to_port     = aws_security_group_rule.allow_ssh.to_port
    protocol    = aws_security_group_rule.allow_ssh.protocol
    cidr_blocks = aws_security_group_rule.allow_ssh.cidr_blocks
  }
  description = "Details of the SSH ingress rule."
}

# ✿ Output details about the egress rule if needed
output "all_outbound_rule" {
  value = {
    from_port   = aws_security_group_rule.allow_all_outbound.from_port
    to_port     = aws_security_group_rule.allow_all_outbound.to_port
    protocol    = aws_security_group_rule.allow_all_outbound.protocol
    cidr_blocks = aws_security_group_rule.allow_all_outbound.cidr_blocks
  }
  description = "Details of the outbound rule allowing all traffic."
}
