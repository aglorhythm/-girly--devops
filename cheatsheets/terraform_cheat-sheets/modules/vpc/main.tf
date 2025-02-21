# ===================================
# Author: @aglorhythm / girlysheet.cloud ✿
# Description: This module will handle VPC creation, subnets, and internet gateway setup.
# ===================================

# ---- VPCs -- >

# Create the "my_aws_vpc"
resource "aws_vpc" "my_aws_vpc" {
  cidr_block = "10.0.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support = true
  tags = {
    Name = "my_aws_vpc"
  }
}

# ---- Subnets -- >

# Public - Create 3 subnets for availability zones a / b /c
resource "aws_subnet" "public_subnet" {
  count             = length(var.azs) # ✿ here you specifies how many times you need to create this resource 
  vpc_id            = aws_vpc.my_aws_vpc.id
  cidr_block        = cidrsubnet(var.cidr_block, 8, count.index)
  availability_zone = var.azs[count.index] # ✿ iterates through our variable azs (availability zones)
  map_public_ip_on_launch = true
  tags = {
    Name = "public-subnet-${var.azs[count.index]}" # ✿ Gives a tag name for each zone in our azs variable
  }
}

# Private - Create 3 subnets for availability zones a / b /c
resource "aws_subnet" "private_subnet" {
  count             = length(var.azs)
  vpc_id            = aws_vpc.my_aws_vpc.id
  cidr_block        = cidrsubnet(var.cidr_block, 8, count.index + length(var.azs))
  availability_zone = var.azs[count.index]
  map_public_ip_on_launch = false
  tags = {
    Name = "private-subnet-${var.azs[count.index]}"
  }
}

# ---- Gateaways -- >

# Create gateway "gw"
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.my_aws_vpc.id

  tags = {
    Name = "my_aws_vpc-gateway"
  }
}

# ---- Routers -- >

# Create a route table "all_access"
resource "aws_route_table" "all_access" {
  vpc_id = aws_vpc.my_aws_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Name = "all_access_to_internet"
  }
}

# Associate a route to public my public subnets
resource "aws_route_table_association" "a" {
  count          = length(aws_subnet.public_subnet)
  subnet_id      = aws_subnet.public_subnet[count.index].id
  route_table_id = aws_route_table.all_access.id
}