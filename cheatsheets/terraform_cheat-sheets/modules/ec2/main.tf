# ===================================
# Author: @aglorhythm / girlysheet.cloud✿
# Description: This module will handle EC2 instance
# ===================================

resource "aws_instance" "vm_terraform" {
  count                  = length(var.instance_details) # ✿ here you specifies how many times you need to create this resource 
  ami                    = data.aws_ami.debian_12.image_id
  instance_type          = var.instance_details[count.index].type # ✿ iterates through our variable instance_details
  subnet_id              = var.instance_details[count.index].subnet_id # same !
  vpc_security_group_ids = var.security_group_ids

  tags = {
    Name = var.instance_details[count.index].name # ✿ Gives a tag name for each instance its creates
  }
}
