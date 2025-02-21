# ===================================
# Author: @aglorhythm / jenkins.cloud ✿
# Description: This module will handle security groups and their rules.
# ===================================


# ---- Security Group -- >

# Create group "my_first_group"
resource "aws_security_group" "jenkins_sg" {
  count       = length(var.sg)  
  name        = var.sg[count.index]
  description = "Security group for jenkins"
  vpc_id      = var.vpc_id

  tags = {
    Name = "sg-${var.sg[count.index]}"
  }
}

# Add Inbound ssh rule to jenkins_sg
resource "aws_vpc_security_group_ingress_rule" "allow_ssh" {
  count             = length(aws_security_group.jenkins_sg)
  security_group_id = aws_security_group.jenkins_sg[count.index].id
  cidr_ipv4         = var.ssh_access_cidr
  ip_protocol       = "tcp"
  from_port         = 22
  to_port           = 22
}

# Add Inbound http rule to jenkins_sg
resource "aws_vpc_security_group_ingress_rule" "allow_inbound_http" {
  count             = length(aws_security_group.jenkins_sg)
  security_group_id = aws_security_group.jenkins_sg[count.index].id
  cidr_ipv4         = var.ssh_access_cidr
  ip_protocol       = "tcp"
  from_port         = 80
  to_port           = 80
}

# Add Inbound https rule to jenkins_sg
resource "aws_vpc_security_group_ingress_rule" "allow_inbound_https" {
  count             = length(aws_security_group.jenkins_sg)
  security_group_id = aws_security_group.jenkins_sg[count.index].id
  cidr_ipv4         = var.ssh_access_cidr
  ip_protocol       = "tcp"
  from_port         = 443
  to_port           = 443
}

# Add Outbound rules to "jenkins_sg"
resource "aws_vpc_security_group_egress_rule" "allow_all_outbound" {
  count             = length(aws_security_group.jenkins_sg)
  security_group_id = aws_security_group.jenkins_sg[count.index].id
  cidr_ipv4         = var.ssh_access_cidr
  ip_protocol       = "-1" # ✿ semantically equivalent to all ports
}