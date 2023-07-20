resource "aws_vpc_endpoint" "s3_interface" {
  vpc_id       = aws_vpc.staging.id
  subnet_ids = [aws_subnet.staging_vpc_subnet_01.id]
  service_name = var.west_2_s3_endpoint
  vpc_endpoint_type = var.vpc_endpoint_s3_type_2
  security_group_ids  = [aws_security_group.vpc_endpoints.id]
  private_dns_enabled  = true
  depends_on = [aws_vpc_endpoint.s3_gateway]
  
  provider = aws.oregon
}

resource "aws_vpc_endpoint" "s3_gateway" {
  vpc_id       = aws_vpc.staging.id
  service_name = var.west_2_s3_endpoint
  vpc_endpoint_type = var.vpc_endpoint_s3_type_1
  route_table_ids = [aws_route_table.staging_vpc_table_01.id]  

  provider = aws.oregon
}

resource "aws_vpc_endpoint_route_table_association" "s3_gateway" {
  route_table_id  = aws_route_table.staging_vpc_table_01.id
  vpc_endpoint_id = aws_vpc_endpoint.s3_gateway.id

  provider = aws.oregon
}

resource "aws_vpc_endpoint" "ec2" {
  vpc_id       = aws_vpc.staging.id
  subnet_ids = [aws_subnet.staging_vpc_subnet_01.id]
  service_name = var.west_2_ec2_endpoint
  vpc_endpoint_type = var.vpc_endpoint_ec2_type
  security_group_ids  = [aws_security_group.vpc_endpoints.id]
  private_dns_enabled  = true

  provider = aws.oregon
}

resource "aws_vpc_endpoint" "drs" {
  vpc_id       = aws_vpc.staging.id
  subnet_ids = [aws_subnet.staging_vpc_subnet_01.id]
  service_name = var.west_2_drs_endpoint
  vpc_endpoint_type = var.vpc_endpoint_drs_type
  security_group_ids  = [aws_security_group.vpc_endpoints.id]
  private_dns_enabled  = true

  provider = aws.oregon
}

resource "aws_vpc_endpoint" "ssm_virginia" {
  vpc_id              = aws_vpc.source.id
  subnet_ids          = [aws_subnet.source_vpc_subnet_01.id]
  service_name        = var.ssm_enpoint_1_virginia
  vpc_endpoint_type   = var.vpc_endpoint_ec2_type
  security_group_ids  = [aws_security_group.vpc_endpoints_virginia.id]
  private_dns_enabled = true

  provider = aws.virginia 
}

resource "aws_vpc_endpoint" "ssm_messages_virginia" {
  vpc_id              = aws_vpc.source.id
  subnet_ids          = [aws_subnet.source_vpc_subnet_01.id]
  service_name        = var.ssm_enpoint_2_virginia
  vpc_endpoint_type   = var.vpc_endpoint_ec2_type
  security_group_ids  = [aws_security_group.vpc_endpoints_virginia.id]
  private_dns_enabled = true

  provider = aws.virginia
}

resource "aws_vpc_endpoint" "ec2messages_virginia" {
  vpc_id              = aws_vpc.source.id
  subnet_ids          = [aws_subnet.source_vpc_subnet_01.id]
  service_name        = var.ssm_enpoint_3_virginia
  vpc_endpoint_type   = var.vpc_endpoint_ec2_type
  security_group_ids  = [aws_security_group.vpc_endpoints_virginia.id]
  private_dns_enabled = true

  provider = aws.virginia 
}

resource "aws_vpc_endpoint" "ssm_oregon" {
  vpc_id              = aws_vpc.target.id
  subnet_ids          = [aws_subnet.target_vpc_subnet_01.id]
  service_name        = var.ssm_enpoint_1_oregon
  vpc_endpoint_type   = var.vpc_endpoint_ec2_type
  security_group_ids  = [aws_security_group.vpc_endpoints_oregon.id]
  private_dns_enabled = true

  provider = aws.oregon 
}

resource "aws_vpc_endpoint" "ssm_messages_oregon" {
  vpc_id              = aws_vpc.target.id
  subnet_ids          = [aws_subnet.target_vpc_subnet_01.id]
  service_name        = var.ssm_enpoint_2_oregon
  vpc_endpoint_type   = var.vpc_endpoint_ec2_type
  security_group_ids  = [aws_security_group.vpc_endpoints_oregon.id]
  private_dns_enabled = true

  provider = aws.oregon
}

resource "aws_vpc_endpoint" "ec2messages_oregon" {
  vpc_id              = aws_vpc.target.id
  subnet_ids          = [aws_subnet.target_vpc_subnet_01.id]
  service_name        = var.ssm_enpoint_3_oregon
  vpc_endpoint_type   = var.vpc_endpoint_ec2_type
  security_group_ids  = [aws_security_group.vpc_endpoints_oregon.id]
  private_dns_enabled = true

  provider = aws.oregon 
}

