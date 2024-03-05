#############################################################
# VPC endpoint to allow console access to the EC2 instances #
# in the source VPC                                         #
#############################################################
resource "aws_vpc_endpoint" "ssm_endpoint_vpc_virginia" {
  vpc_id              = aws_vpc.vpc_01_virginia.id
  subnet_ids          = [aws_subnet.subnet01_vpc_virginia.id]
  service_name        = var.ssm_enpoint_1_vpc_virginia
  vpc_endpoint_type   = var.vpc_endpoint_ec2_type_vpc_virginia
  security_group_ids  = [aws_security_group.vpc_endpoints_vpc_virginia.id]
  private_dns_enabled = true

  provider = aws.virginia
}

#############################################################
# VPC endpoint to allow console access to the EC2 instances #
# in the source VPC                                         #
#############################################################
resource "aws_vpc_endpoint" "ssm_messages_vpc_virginia" {
  vpc_id              = aws_vpc.vpc_01_virginia.id
  subnet_ids          = [aws_subnet.subnet01_vpc_virginia.id]
  service_name        = var.ssm_enpoint_2_vpc_virginia
  vpc_endpoint_type   = var.vpc_endpoint_ec2_type_vpc_virginia
  security_group_ids  = [aws_security_group.vpc_endpoints_vpc_virginia.id]
  private_dns_enabled = true

  provider = aws.virginia
}

#############################################################
# VPC endpoint to allow console access to the EC2 instances #
# in the source VPC                                         #
#############################################################
resource "aws_vpc_endpoint" "ec2_messages_vpc_virginia" {
  vpc_id              = aws_vpc.vpc_01_virginia.id
  subnet_ids          = [aws_subnet.subnet01_vpc_virginia.id]
  service_name        = var.ssm_enpoint_3_vpc_virginia
  vpc_endpoint_type   = var.vpc_endpoint_ec2_type_vpc_virginia
  security_group_ids  = [aws_security_group.vpc_endpoints_vpc_virginia.id]
  private_dns_enabled = true

  provider = aws.virginia
}

##########################################################
# S3 VPC Endpoint Interface deployed in the staging VPC  #
##########################################################
resource "aws_vpc_endpoint" "s3_interface_vpc_virginia" {
  vpc_id             = aws_vpc.vpc_01_virginia.id
  subnet_ids         = [aws_subnet.subnet03_vpc_virginia.id]
  service_name       = var.s3_int_vpc_endpoint_virginia
  vpc_endpoint_type  = var.vpc_endpoint_ec2_type_vpc_virginia
  security_group_ids = [aws_security_group.vpc_endpoints_vpc_virginia.id]
  #private_dns_enabled = true

  provider = aws.virginia
}
