# ===================================
# Author: @aglorhythm / girlysheet.cloud ✿
# Description: This script will handle the 
# creation of all things described inside our modules.
# ===================================

terraform {
  required_providers {

    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }

     ovh = {
      source  = "ovh/ovh"
    }
  }

  backend "s3" {
    bucket                  = "tfstate-jenkins"
    key                     = "./terraform.tfstate"
    region                  = "eu-west-3"
  }
}


provider "aws" {
  region  = "eu-west-3"
}

provider "ovh" {
  endpoint          = "ovh-eu"
  application_key   = var.ovh_application_key
  application_secret = var.ovh_application_secret
  consumer_key      = var.ovh_consumer_key
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

# Create VPC
module "vpc" {
  source     = "./modules/vpc"
  azs        = var.azs
  cidr_block = "192.168.0.0/16"
}

# Add security config
module "security" {
  source   = "./modules/security"
  vpc_id   = module.vpc.vpc_id
  ssh_access_cidr = "0.0.0.0/0"
}

# Fetch the public key path from the environment variable
locals {
  ssh_key_path = pathexpand(var.ssh_key_path) 
}

# -- Cle SSH
resource "aws_key_pair" "jenkins_key" {
  key_name   = var.key
  public_key = file("${local.ssh_key_path}/${var.key}.pub")
}

# Create ec2 Instance
module "ec2" {
  source            = "./modules/ec2"
  security_group_ids = [module.security.security_group_id[0]] 
  instance_details  = [
    {
      name                = "vm_jenkins_public"
      type                = "t3.micro"
      subnet_id           = module.vpc.public_subnet_ids[0]
      ami                 = data.aws_ami.debian_12.id  
      key_name            = aws_key_pair.jenkins_key.key_name 
    }
  ]
  depends_on          = [aws_key_pair.jenkins_key] 
}

# 

resource "ovh_domain_zone_record" "sub_jenkins" {
  zone       = var.domain_name
  fieldtype  = "A"
  subdomain  = "jenkins"
  ttl        = 3600
  target     = module.ec2.instance_jenkins_ip
}