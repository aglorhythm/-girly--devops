# ===================================
# Author: @aglorhythm / girlysheet.cloud✿
# Description: This module will handle EC2 instance
# ===================================

resource "aws_instance" "vm_jenkins" {
  count                  = length(var.instance_details) 
  ami                    = var.instance_details[count.index].ami
  instance_type          = var.instance_details[count.index].type 
  subnet_id              = var.instance_details[count.index].subnet_id 
  vpc_security_group_ids = var.security_group_ids
  key_name               = var.instance_details[count.index].key_name
  tags = {
    Name = var.instance_details[count.index].name 
  }
}
