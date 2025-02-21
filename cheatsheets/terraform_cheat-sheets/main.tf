# ===================================
# Author: @aglorhythm / girlysheet.cloud ✿
# Description: This script will handle the 
# creation of all things described inside our modules.
# ===================================

provider "aws" {
  region  = "eu-central-1"
}

# Fetch the latest Debian AMI
data "aws_ami" "debian_12" {
  most_recent = true
  owners      = ["136693071363"]

  filter {
    name   = "name"
    values = ["debian-12-amd64-20240507-1740"]
  }
}

module "vpc" {
  source     = "./modules/vpc"
  azs        = var.azs
  cidr_block = "10.0.0.0/16"
}

module "security" {
  source   = "./modules/security"
  vpc_id   = module.vpc.vpc_id
  ssh_access_cidr = "0.0.0.0/0"
}

module "ec2" {
  source            = "./modules/ec2"
  security_group_ids = [module.security.security_group_id]  
  instance_details  = [
    {
      name       = "vm_mydebian_12_public_1"
      type       = "t2.micro"
      subnet_id  = module.vpc.public_subnet_ids[0]
      ami        = data.aws_ami.debian_12.id  
      key_name   = "your-key-name-here"  
    },
    {
      name       = "vm_mydebian_12_private_1"
      type       = "t2.micro"
      subnet_id  = module.vpc.private_subnet_ids[0]
      ami        = data.aws_ami.debian_12.id
      key_name   = "your-key-name-here"
    }
  ]
}

