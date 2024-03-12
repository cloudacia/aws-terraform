###############################################
#  VPC CONFIGURATION                          #
###############################################
resource "aws_vpc" "vpc_01_oregon" {
  cidr_block           = var.vpc_cidr_oregon
  enable_dns_hostnames = true

  tags = {
    Name = "VPC OREGON"
  }

  provider = aws.oregon
}

###############################################
#  SUBNET 01                                  #
###############################################
resource "aws_subnet" "subnet01_vpc_oregon" {
  vpc_id            = aws_vpc.vpc_01_oregon.id
  cidr_block        = var.subnet01_vpc_oregon
  availability_zone = var.availability_zone01_oregon

  tags = {
    Name = "PUBLIC-SUBNET-01"
  }

  provider = aws.oregon
}

###############################################
#  SUBNET 02                                  #
###############################################
resource "aws_subnet" "subnet02_vpc_oregon" {
  vpc_id            = aws_vpc.vpc_01_oregon.id
  cidr_block        = var.subnet02_vpc_oregon
  availability_zone = var.availability_zone02_oregon

  tags = {
    Name = "PUBLIC-SUBNET-02"
  }

  provider = aws.oregon
}

###############################################
#  SUBNET 03                                  #
###############################################
resource "aws_subnet" "subnet03_vpc_oregon" {
  vpc_id            = aws_vpc.vpc_01_oregon.id
  cidr_block        = var.subnet03_vpc_oregon
  availability_zone = var.availability_zone01_oregon

  tags = {
    Name = "PUBLIC-PRIVATE-01"
  }

  provider = aws.oregon
}

###############################################
#  SUBNET 04                                  #
###############################################
resource "aws_subnet" "subnet04_vpc_oregon" {
  vpc_id            = aws_vpc.vpc_01_oregon.id
  cidr_block        = var.subnet04_vpc_oregon
  availability_zone = var.availability_zone02_oregon

  tags = {
    Name = "PUBLIC-PRIVATE-02"
  }

  provider = aws.oregon
}

###############################################
#  ROUTING TABLE #1                           #
###############################################
resource "aws_route_table" "rt01_vpc_oregon" {
  vpc_id = aws_vpc.vpc_01_oregon.id

  tags = {
    Name = "PUBLIC RT"
  }

  provider = aws.oregon
}

###############################################
#  ROUTE ASSOCIATION                          #
###############################################
resource "aws_route_table_association" "rta01_vpc_oregon" {
  subnet_id      = aws_subnet.subnet01_vpc_oregon.id
  route_table_id = aws_route_table.rt01_vpc_oregon.id

  provider = aws.oregon
}

##############################################
#  ROUTE ASSOCIATION                          #
###############################################
resource "aws_route_table_association" "rta02_vpc_oregon" {
  subnet_id      = aws_subnet.subnet02_vpc_oregon.id
  route_table_id = aws_route_table.rt01_vpc_oregon.id

  provider = aws.oregon
}

###############################################
#  ROUTING TABLE #2                           #
###############################################
resource "aws_route_table" "rt02_vpc_oregon" {
  vpc_id = aws_vpc.vpc_01_oregon.id

  tags = {
    Name = "PRIVATE RT"
  }

  provider = aws.oregon
}

###############################################
#  ROUTE ASSOCIATION                          #
###############################################
resource "aws_route_table_association" "rta03_vpc_oregon" {
  subnet_id      = aws_subnet.subnet03_vpc_oregon.id
  route_table_id = aws_route_table.rt02_vpc_oregon.id

  provider = aws.oregon
}

###############################################
#  ROUTE ASSOCIATION                          #
###############################################
resource "aws_route_table_association" "rta04_vpc_oregon" {
  subnet_id      = aws_subnet.subnet04_vpc_oregon.id
  route_table_id = aws_route_table.rt02_vpc_oregon.id

  provider = aws.oregon
}

###############################################
#  INTERNET GATEWAY                          #
###############################################
resource "aws_internet_gateway" "ig_vpc_oregon" {
  vpc_id = aws_vpc.vpc_01_oregon.id

  tags = {
    Name = "INTERNET GATEWAY"
  }

  provider = aws.oregon
}

################################################
#  ADDING INTERNET GATEWAY AS DEFAULT ROUTE    #
################################################
resource "aws_route" "internet_gateway_vpc_oregon" {
  route_table_id         = aws_route_table.rt01_vpc_oregon.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.ig_vpc_oregon.id

  provider = aws.oregon
}

####################################################
# EIP for a NAT Gateway                            #
####################################################
resource "aws_eip" "ip_nat01_oregon" {
  vpc = true

  tags = {
    Name = "NAT GATEWAY OREGON"
  }

  provider = aws.oregon
}

####################################################
# VPC NAT Gateway                                  #
####################################################
resource "aws_nat_gateway" "gw01_vpc_oregon" {
  allocation_id     = aws_eip.ip_nat01_oregon.id
  connectivity_type = "public"
  subnet_id         = aws_subnet.subnet01_vpc_oregon.id

  tags = {
    Name = "NAT GATEWAY OREGON"
  }

  provider = aws.oregon
}
#############################################################
# Adding a route in the routing table for a NAT gateway     #
#############################################################
resource "aws_route" "nat_gateway01_vpc_oreogn" {
  route_table_id         = aws_route_table.rt02_vpc_oregon.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_nat_gateway.gw01_vpc_oregon.id

  provider = aws.oregon
}
