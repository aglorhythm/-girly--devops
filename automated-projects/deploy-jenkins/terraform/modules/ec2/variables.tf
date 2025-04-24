# ===================================
# Author: @aglorhythm / girlysheet.cloud ✿
# Description: Here we define our variables. They can be used dynamically !
# ===================================

variable "instance_details" {
  description = "A list of maps containing details for each instance to be created."
  type = list(object({
    name       : string
    type       : string
    subnet_id  : string
    ami        : string
    key_name   : string
  }))
  default = [
    {
      name      = "jenkins_instance"
      type      = "t3.micro"
      subnet_id = "subnet-05595bda72edb7ffe"  
      ami       = "ami-0ffe9ce6174b8d6c2"         
      key_name  = "aws_jenkins_rsa"
    }
  ]
}

variable "security_group_ids" {
  description = "List of security group IDs to attach to each instance."
  type        = list(string) 
  default     = ["sg-0f6d48a88b76f840a"]
}