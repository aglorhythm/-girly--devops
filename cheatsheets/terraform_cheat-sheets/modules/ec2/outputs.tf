# ===================================
# Author: @aglorhythm / girlysheet.cloud ✿
# Description: Creating an outputs.tf file is an excellent practice to 
# expose important information about the resources you're managing.
# These variables can be reused in other configuration files.
# ===================================

## to update - not complete

output "instance_ids" {
  value = {
    for instance in aws_instance.vm_terraform : instance.tags["Name"] => instance.id
  }
  description = "Map of instance names to their corresponding IDs."
}

output "instance_public_ips" {
  value = {
    for instance in aws_instance.vm_terraform : instance.tags["Name"] => instance.public_ip
  }
  description = "Map of instance names to their public IPs."
}

output "instance_private_ips" {
  value = {
    for instance in aws_instance.vm_terraform : instance.tags["Name"] => instance.private_ip
  }
  description = "Map of instance names to their private IPs."
}
