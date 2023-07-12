resource "aws_vpc" "staging" {
  cidr_block           = var.staging_vpc_cidr
  enable_dns_hostnames = var.enable_dns

  tags = {
    Name = "DRS-STAGING-VPC"
  }
}

resource "aws_subnet" "staging_vpc_subnet01" {
  vpc_id            = aws_vpc.staging.id
  cidr_block        = var.staging_vpc_subnet01
  availability_zone = var.staging_vpc_availability_zone01

  tags = {
    Name = "DRS-STAGING-VPC-SUBNET01"
  }
}

resource "aws_route_table" "staging_vpc_rt01" {
  vpc_id = aws_vpc.staging.id

  tags = {
    Name = "DRS-STAGING-VPC-RT01"
  }
}

resource "aws_route_table_association" "staging_vpc_rta01" {
  subnet_id      = aws_subnet.staging_vpc_subnet01.id
  route_table_id = aws_route_table.staging_vpc_rt01.id
}

resource "aws_internet_gateway" "staging_vpc_ig" {
  vpc_id = aws_vpc.staging.id

  tags = {
    Name = "DRS-STAGING-VPC-IG"
  }
}

resource "aws_route" "staging_vpc_default_1" {
  route_table_id         = aws_route_table.staging_vpc_rt01.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.staging_vpc_ig.id
}
