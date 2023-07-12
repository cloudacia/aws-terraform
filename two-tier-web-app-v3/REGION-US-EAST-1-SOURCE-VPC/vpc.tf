resource "aws_vpc" "this" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = var.enable_dns

  tags = {
    Name = "DRS-SOURCE-VPC"
  }
}

resource "aws_subnet" "subnet01" {
  vpc_id            = aws_vpc.this.id
  cidr_block        = var.subnet01
  availability_zone = var.availability_zone01

  tags = {
    Name = "DRS-SOURCE-VPC-SUBNET01"
  }
}

resource "aws_route_table" "rt01" {
  vpc_id = aws_vpc.this.id

  tags = {
    Name = "DRS-SOURCE-VPC-RT01"
  }
}

resource "aws_route_table_association" "rta01" {
  subnet_id      = aws_subnet.subnet01.id
  route_table_id = aws_route_table.rt01.id
}


resource "aws_internet_gateway" "this" {
  vpc_id = aws_vpc.this.id

  tags = {
    Name = "DRS-SOURCE-VPC-IG"
  }
}

resource "aws_route" "default_1" {
  route_table_id         = aws_route_table.rt01.id
  destination_cidr_block = var.default_gateway_1
  gateway_id             = aws_internet_gateway.this.id
}
