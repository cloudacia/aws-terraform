resource "aws_vpc" "source" {
  cidr_block           = var.source_vpc_cidr
  enable_dns_hostnames = var.source_enable_dns

  tags = {
    Name = "drs-source-vpc"
  }

  provider = aws.virginia
}

resource "aws_vpc" "staging" {
  cidr_block           = var.staging_vpc_cidr
  enable_dns_hostnames = var.staging_enable_dns

  tags = {
    Name = "drs-staging-vpc"
  }

  provider = aws.oregon
}

resource "aws_vpc" "target" {
  cidr_block           = var.target_vpc_cidr
  enable_dns_hostnames = var.target_enable_dns

  tags = {
    Name = "drs-target-vpc"
  }

  provider = aws.oregon
}

resource "aws_subnet" "source_vpc_subnet_01" {
  vpc_id            = aws_vpc.source.id
  cidr_block        = var.source_vpc_subnet_01_cidr
  availability_zone = var.source_vpc_subnet_01_az

  tags = {
    Name = "drs-source-vpc-subnet-01"
  }

  provider = aws.virginia
}

resource "aws_subnet" "staging_vpc_subnet_01" {
  vpc_id            = aws_vpc.staging.id
  cidr_block        = var.staging_vpc_subnet_01_cidr
  availability_zone = var.staging_vpc_subnet_01_az

  tags = {
    Name = "drs-staging-vpc-subnet-01"
  }

  provider = aws.oregon
}

resource "aws_subnet" "target_vpc_subnet_01" {
  vpc_id            = aws_vpc.target.id
  cidr_block        = var.target_vpc_subnet_01_cidr
  availability_zone = var.target_vpc_subnet_01_az

  tags = {
    Name = "drs-target-vpc-subnet-01"
  }

  provider = aws.oregon
}

resource "aws_route_table" "source_vpc_table_01" {
  vpc_id = aws_vpc.source.id

  tags = {
    Name = "drs-source-vpc-rt-01"
  }

  provider = aws.virginia
}

resource "aws_route_table" "staging_vpc_table_01" {
    vpc_id = aws_vpc.staging.id

    tags = {
        Name = "drs-staging-vpc-rt-01"
  }

  provider = aws.oregon
}

resource "aws_route_table" "target_vpc_table_01" {
  vpc_id = aws_vpc.target.id

  tags = {
    Name = "drs-target-vpc-rt-01"
  }

  provider = aws.oregon
}

resource "aws_route_table_association" "source_vpc_rta_01" {
  subnet_id      = aws_subnet.source_vpc_subnet_01.id
  route_table_id = aws_route_table.source_vpc_table_01.id

  provider = aws.virginia  
}

resource "aws_route_table_association" "stating_vpc_rta_01" {
  subnet_id      = aws_subnet.staging_vpc_subnet_01.id
  route_table_id = aws_route_table.staging_vpc_table_01.id

  provider = aws.oregon
}

resource "aws_route_table_association" "target_vpc_rta_01" {
  subnet_id      = aws_subnet.target_vpc_subnet_01.id
  route_table_id = aws_route_table.target_vpc_table_01.id

  provider = aws.oregon
}

resource "aws_internet_gateway" "source_vpc" {
  vpc_id = aws_vpc.source.id

  tags = {
    Name = "drs-source-vpc-ig"
  }

  provider = aws.virginia
}

resource "aws_internet_gateway" "target_vpc" {
  vpc_id = aws_vpc.target.id

  tags = {
    Name = "drs-target-vpc-ig"
  }

  provider = aws.oregon
}

resource "aws_route" "source_vpc_default_gateway" {
  route_table_id         = aws_route_table.source_vpc_table_01.id
  destination_cidr_block = var.route_default_gateway
  gateway_id             = aws_internet_gateway.source_vpc.id

  provider = aws.virginia
}

resource "aws_route" "target_vpc_default_gateway" {
  route_table_id         = aws_route_table.target_vpc_table_01.id
  destination_cidr_block = var.route_default_gateway
  gateway_id             = aws_internet_gateway.target_vpc.id

  provider = aws.oregon
}