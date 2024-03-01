###############################################
#  VPC CONFIGURATION                          #
###############################################
resource "aws_vpc" "vpc_01_virginia" {
  cidr_block           = var.vpc_cidr_virginia
  enable_dns_hostnames = true

  tags = {
    Name = "VPC VIRGINIA"
  }

  provider = aws.virginia
}

###############################################
#  SUBNET 01                                  #
###############################################
resource "aws_subnet" "subnet01_vpc_virginia" {
  vpc_id            = aws_vpc.vpc_01_virginia.id
  cidr_block        = var.subnet01_vpc_virginia
  availability_zone = var.availability_zone01_virginia

  tags = {
    Name = "PUBLIC-SUBNET-01"
  }

  provider = aws.virginia
}

###############################################
#  SUBNET 02                                  #
###############################################
resource "aws_subnet" "subnet02_vpc_virginia" {
  vpc_id            = aws_vpc.vpc_01_virginia.id
  cidr_block        = var.subnet02_vpc_virginia
  availability_zone = var.availability_zone02_virginia

  tags = {
    Name = "PUBLIC-SUBNET-02"
  }

  provider = aws.virginia
}

###############################################
#  SUBNET 03                                  #
###############################################
resource "aws_subnet" "subnet03_vpc_virginia" {
  vpc_id            = aws_vpc.vpc_01_virginia.id
  cidr_block        = var.subnet03_vpc_virginia
  availability_zone = var.availability_zone01_virginia

  tags = {
    Name = "PRIVATE-SUBNET-01"
  }

  provider = aws.virginia
}

###############################################
#  SUBNET 04                                  #
###############################################
resource "aws_subnet" "subnet04_vpc_virginia" {
  vpc_id            = aws_vpc.vpc_01_virginia.id
  cidr_block        = var.subnet04_vpc_virginia
  availability_zone = var.availability_zone02_virginia

  tags = {
    Name = "PRIVATE-SUBNET-02"
  }

  provider = aws.virginia
}

###############################################
#  ROUTING TABLE #1                           #
###############################################
resource "aws_route_table" "rt01_vpc_virginia" {
  vpc_id = aws_vpc.vpc_01_virginia.id

  tags = {
    Name = "PUBLIC RT"
  }

  provider = aws.virginia
}

###############################################
#  ROUTE ASSOCIATION                          #
###############################################
resource "aws_route_table_association" "rta01_vpc_virginia" {
  subnet_id      = aws_subnet.subnet01_vpc_virginia.id
  route_table_id = aws_route_table.rt01_vpc_virginia.id

  provider = aws.virginia
}

###############################################
#  ROUTE ASSOCIATION                          #
###############################################
resource "aws_route_table_association" "rta02_vpc_virginia" {
  subnet_id      = aws_subnet.subnet02_vpc_virginia.id
  route_table_id = aws_route_table.rt01_vpc_virginia.id

  provider = aws.virginia
}

###############################################
#  ROUTING TABLE #2                           #
###############################################
resource "aws_route_table" "rt02_vpc_virginia" {
  vpc_id = aws_vpc.vpc_01_virginia.id

  tags = {
    Name = "PRIVATE RT"
  }

  provider = aws.virginia
}

###############################################
#  ROUTE ASSOCIATION                          #
###############################################
resource "aws_route_table_association" "rta03_vpc_virginia" {
  subnet_id      = aws_subnet.subnet03_vpc_virginia.id
  route_table_id = aws_route_table.rt02_vpc_virginia.id

  provider = aws.virginia
}

###############################################
#  ROUTE ASSOCIATION                          #
###############################################
resource "aws_route_table_association" "rta04_vpc_virginia" {
  subnet_id      = aws_subnet.subnet04_vpc_virginia.id
  route_table_id = aws_route_table.rt02_vpc_virginia.id

  provider = aws.virginia
}

###############################################
#  INTERNET GATEWAY                          #
###############################################
resource "aws_internet_gateway" "ig_vpc_virginia" {
  vpc_id = aws_vpc.vpc_01_virginia.id

  tags = {
    Name = "INTERNET GATEWAY"
  }

  provider = aws.virginia
}

################################################
#  ADDING INTERNET GATEWAY AS DEFAULT ROUTE    #
################################################
resource "aws_route" "internet_gateway_vpc_virginia" {
  route_table_id         = aws_route_table.rt01_vpc_virginia.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.ig_vpc_virginia.id

  provider = aws.virginia
}
