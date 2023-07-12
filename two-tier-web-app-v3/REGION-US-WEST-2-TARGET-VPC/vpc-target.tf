resource "aws_vpc" "target" {
  cidr_block           = var.vpc_target_cidr
  enable_dns_hostnames = var.enable_dns

  tags = {
    Name = "DRS-TARGET-VPC"
  }
}

resource "aws_subnet" "target_vpc_subnet01" {
  vpc_id            = aws_vpc.target.id
  cidr_block        = var.target_vpc_subnet01
  availability_zone = var.target_vpc_availability_zone01

  tags = {
    Name = "DRS-TARGET-VPC-SUBNET01"
  }
}

resource "aws_route_table" "target_vpc_rt01" {
  vpc_id = aws_vpc.target.id

  tags = {
    Name = "DRS-TARGET-VPC-RT01"
  }
}

resource "aws_route_table_association" "target_vpc_rta01" {
  subnet_id      = aws_subnet.target_vpc_subnet01.id
  route_table_id = aws_route_table.target_vpc_rt01.id
}


resource "aws_internet_gateway" "target_vpc_ig" {
  vpc_id = aws_vpc.target.id

  tags = {
    Name = "DRS-TARGET-VPC-IG"
  }
}

resource "aws_route" "target_vpc_default_1" {
  route_table_id         = aws_route_table.target_vpc_rt01.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.target_vpc_ig.id
}
