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
  vpc_id            = aws_vpc.cloudacia_vpc.id
  cidr_block        = var.subnet01
  availability_zone = var.availability_zone01

  tags = {
    Name = "cloudacia"
  }
}

###############################################
#  SUBNET 02                                  #
###############################################
resource "aws_subnet" "subnet02" {
  vpc_id            = aws_vpc.cloudacia_vpc.id
  cidr_block        = var.subnet02
  availability_zone = var.availability_zone02

  tags = {
    Name = "cloudacia"
  }
}

###############################################
#  SUBNET 03                                  #
###############################################
resource "aws_subnet" "subnet03" {
  vpc_id            = aws_vpc.cloudacia_vpc.id
  cidr_block        = var.subnet03
  availability_zone = var.availability_zone01

  tags = {
    Name = "cloudacia"
  }
}

###############################################
#  SUBNET 04                                  #
###############################################
resource "aws_subnet" "subnet04" {
  vpc_id            = aws_vpc.cloudacia_vpc.id
  cidr_block        = var.subnet04
  availability_zone = var.availability_zone02

  tags = {
    Name = "cloudacia"
  }
}

###############################################
#  SUBNET 05                                  #
###############################################
resource "aws_subnet" "subnet05" {
  vpc_id            = aws_vpc.cloudacia_vpc.id
  cidr_block        = var.subnet05
  availability_zone = var.availability_zone01

  tags = {
    Name = "cloudacia"
  }
}

###############################################
#  SUBNET 06                                  #
###############################################
resource "aws_subnet" "subnet06" {
  vpc_id            = aws_vpc.cloudacia_vpc.id
  cidr_block        = var.subnet06
  availability_zone = var.availability_zone02

  tags = {
    Name = "cloudacia"
  }
}

###############################################
#  SUBNET 07                                  #
###############################################
resource "aws_subnet" "subnet07" {
  vpc_id            = aws_vpc.cloudacia_vpc.id
  cidr_block        = var.subnet07
  availability_zone = var.availability_zone01

  tags = {
    Name = "cloudacia"
  }
}

###############################################
#  SUBNET 08                                  #
###############################################
resource "aws_subnet" "subnet08" {
  vpc_id            = aws_vpc.cloudacia_vpc.id
  cidr_block        = var.subnet08
  availability_zone = var.availability_zone02

  tags = {
    Name = "cloudacia"
  }
}

###############################################
#  SUBNET 09                                  #
###############################################
resource "aws_subnet" "subnet09" {
  vpc_id            = aws_vpc.cloudacia_vpc.id
  cidr_block        = var.subnet09
  availability_zone = var.availability_zone01

  tags = {
    Name = "cloudacia"
  }
}

###############################################
#  SUBNET 10                                  #
###############################################
resource "aws_subnet" "subnet10" {
  vpc_id            = aws_vpc.cloudacia_vpc.id
  cidr_block        = var.subnet10
  availability_zone = var.availability_zone02

  tags = {
    Name = "cloudacia"
  }
}

###############################################
#  ROUTING TABLE #1                           #
###############################################
resource "aws_route_table" "rt01" {
  vpc_id = aws_vpc.cloudacia_vpc.id

  tags = {
    Name = "cloudacia"
  }
}

###############################################
#  ROUTING TABLE #2                           #
###############################################
resource "aws_route_table" "rt02" {
  vpc_id = aws_vpc.cloudacia_vpc.id

  tags = {
    Name = "cloudacia"
  }
}

###############################################
#  ROUTING TABLE #3                           #
###############################################
resource "aws_route_table" "rt03" {
  vpc_id = aws_vpc.cloudacia_vpc.id

  tags = {
    Name = "cloudacia"
  }
}

###############################################
#  ROUTING TABLE #4                           #
###############################################
resource "aws_route_table" "rt04" {
  vpc_id = aws_vpc.cloudacia_vpc.id

  tags = {
    Name = "cloudacia"
  }
}

###############################################
#  ROUTING TABLE #5                           #
###############################################
resource "aws_route_table" "rt05" {
  vpc_id = aws_vpc.cloudacia_vpc.id

  tags = {
    Name = "cloudacia"
  }
}

###############################################
#  ROUTING TABLE #6                           #
###############################################
resource "aws_route_table" "rt06" {
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
#  ROUTE ASSOCIATION                          #
###############################################
resource "aws_route_table_association" "rta03" {
  subnet_id      = aws_subnet.subnet03.id
  route_table_id = aws_route_table.rt02.id
}

###############################################
#  ROUTE ASSOCIATION                          #
###############################################
resource "aws_route_table_association" "rta04" {
  subnet_id      = aws_subnet.subnet04.id
  route_table_id = aws_route_table.rt03.id
}

###############################################
#  ROUTE ASSOCIATION                          #
###############################################
resource "aws_route_table_association" "rta05" {
  subnet_id      = aws_subnet.subnet05.id
  route_table_id = aws_route_table.rt04.id
}


###############################################
#  ROUTE ASSOCIATION                          #
###############################################
resource "aws_route_table_association" "rta06" {
  subnet_id      = aws_subnet.subnet06.id
  route_table_id = aws_route_table.rt04.id
}

###############################################
#  ROUTE ASSOCIATION                          #
###############################################
resource "aws_route_table_association" "rta07" {
  subnet_id      = aws_subnet.subnet07.id
  route_table_id = aws_route_table.rt05.id
}


###############################################
#  ROUTE ASSOCIATION                          #
###############################################
resource "aws_route_table_association" "rta08" {
  subnet_id      = aws_subnet.subnet08.id
  route_table_id = aws_route_table.rt05.id
}

###############################################
#  ROUTE ASSOCIATION                          #
###############################################
resource "aws_route_table_association" "rta09" {
  subnet_id      = aws_subnet.subnet09.id
  route_table_id = aws_route_table.rt06.id
}

###############################################
#  ROUTE ASSOCIATION                          #
###############################################
resource "aws_route_table_association" "rta10" {
  subnet_id      = aws_subnet.subnet10.id
  route_table_id = aws_route_table.rt06.id
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

####################################################
# VPC NAT Gateway                                  #
####################################################
resource "aws_nat_gateway" "gw01" {
  allocation_id = aws_eip.ip_nat01.id
  subnet_id     = aws_subnet.subnet01.id

  tags = {
    Name = "NAT Gateway #1"
  }

  depends_on = [aws_internet_gateway.ig]
}

####################################################
# VPC NAT Gateway                                  #
####################################################
resource "aws_nat_gateway" "gw02" {
  allocation_id = aws_eip.ip_nat02.id
  subnet_id     = aws_subnet.subnet02.id

  tags = {
    Name = "NAT Gateway #2"
  }

  depends_on = [aws_internet_gateway.ig]
}

####################################################
# EIP for a NAT Gateway                            #
####################################################
resource "aws_eip" "ip_nat01" {
  vpc = true

  tags = {
    Name = "NAT Gateway #1"
  }
}

####################################################
# EIP for a NAT Gateway                            #
####################################################
resource "aws_eip" "ip_nat02" {
  vpc = true

  tags = {
    Name = "NAT Gateway #2"
  }
}

#############################################################
# Adding a route in the routing table for a NAT gateway     #
#############################################################
resource "aws_route" "nat_gateway01" {
  route_table_id         = aws_route_table.rt02.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_nat_gateway.gw01.id
}


#############################################################
# Adding a route in the routing table for a NAT gateway     #
#############################################################
resource "aws_route" "nat_gateway02" {
  route_table_id         = aws_route_table.rt03.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_nat_gateway.gw02.id
}
