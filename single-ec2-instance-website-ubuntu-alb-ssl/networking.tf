###############################################
#  VPC CONFIGURATION                          #
###############################################
resource "aws_vpc" "cloudacia_vpc" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true

  tags = {
    Name = "cloudacia"
  }
}

###############################################
#  SUBNET 01                                  #
###############################################
resource "aws_subnet" "subnet01" {
  vpc_id               = aws_vpc.cloudacia_vpc.id
  cidr_block           = var.subnet01
  availability_zone_id = var.availability_zone01

  tags = {
    Name = "cloudacia"
  }
}

###############################################
#  SUBNET 02                                  #
###############################################
resource "aws_subnet" "subnet02" {
  vpc_id               = aws_vpc.cloudacia_vpc.id
  cidr_block           = var.subnet02
  availability_zone_id = var.availability_zone02

  tags = {
    Name = "cloudacia"
  }
}

###############################################
#  ROUTING TABLE                              #
###############################################
resource "aws_route_table" "rt01" {
  vpc_id = aws_vpc.cloudacia_vpc.id

  tags = {
    Name = "cloudacia"
  }
}

###############################################
#  ROUTE ASSOCIATION                          #
###############################################
resource "aws_route_table_association" "rta01" {
  subnet_id      = aws_subnet.subnet01.id
  route_table_id = aws_route_table.rt01.id
}

###############################################
#  ROUTE ASSOCIATION                          #
###############################################
resource "aws_route_table_association" "rta02" {
  subnet_id      = aws_subnet.subnet02.id
  route_table_id = aws_route_table.rt01.id
}

###############################################
#  INTERNET GATEWAY                          #
###############################################
resource "aws_internet_gateway" "ig" {
  vpc_id = aws_vpc.cloudacia_vpc.id

  tags = {
    Name = "cloudacia"
  }
}

################################################
#  ADDING INTERNET GATEWAY AS DEFAULT ROUTE    #
################################################
resource "aws_route" "internet_gateway" {
  route_table_id         = aws_route_table.rt01.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.ig.id
}
