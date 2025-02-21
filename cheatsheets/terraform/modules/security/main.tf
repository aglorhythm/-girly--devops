# ===================================
# Author: @aglorhythm / girlysheet.cloud ✿
# Description: This module will handle security groups and their rules.
# ===================================



# ---- Security Group -- >

# Create group "my_first_group"
resource "aws_security_group" "my_first_group" {
  name        = "my first group"
  description = "Allow SSH connection on ports 22 and all outbound traffic"
  vpc_id      = var.vpc_id

  tags = {
    Name = "my_first_group"
  }
}

# Add Inbound rules to "my_first_group"
resource "aws_vpc_security_group_ingress_rule" "allow_ssh" {
  security_group_id = aws_security_group.my_first_group.id
  cidr_ipv4         = [var.ssh_access_cidr] # ✿ we add [] around to indicate this is a list
  ip_protocol       = "tcp"
  from_port         = 22
  to_port           = 22
}

# Add Outbound rules to "my_first_group"
resource "aws_vpc_security_group_egress_rule" "allow_all_outbound" {
  security_group_id = aws_security_group.my_first_group.id
  cidr_ipv4         = [var.ssh_access_cidr]
  ip_protocol       = "-1" # ✿ semantically equivalent to all ports
}