# ===================================
# Author: @aglorhythm / girlysheet.cloud ✿
# Description: This module will handle VPC creation, subnets, and internet gateway setup.
# ===================================

# ---- VPCs -- >

# Create the "jenkins_vpc"
resource "aws_vpc" "jenkins_vpc" {
  cidr_block = "192.168.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support = true
  tags = {
    Name = "jenkins-vpc"
  }
}

# ---- Gateaways -- >

# Create gateway "jenkins_gw"
resource "aws_internet_gateway" "jenkins_gw" {
  vpc_id = aws_vpc.jenkins_vpc.id

  tags = {
    Name = "jenkins_vpc-gateway"
  }
}

# ---- Subnets -- >

# Public - Create subnets for availability zones
resource "aws_subnet" "public_subnets" {
  count             = length(var.azs) 
  vpc_id            = aws_vpc.jenkins_vpc.id
  cidr_block        = cidrsubnet(var.cidr_block, 8, count.index)
  availability_zone = var.azs[count.index] 
  map_public_ip_on_launch = true
  tags = {
    Name = "public-subnet-${var.azs[count.index]}" 
  }
}


# ---- Routers -- >

# Create a route table 
resource "aws_route_table" "public_subnets_route" {
  vpc_id = aws_vpc.jenkins_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.jenkins_gw.id
  }

  tags = {
    Name = "public_subnet_route"
  }
}

# Associate a route to public subnets
resource "aws_route_table_association" "public_subnet_route_association" {
  count          = length(aws_subnet.public_subnets)
  subnet_id      = aws_subnet.public_subnets[count.index].id
  route_table_id = aws_route_table.public_subnets_route.id
}