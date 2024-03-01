#############################################################
# VPC endpoint to allow console access to the EC2 instances #
# in the source VPC                                         #
#############################################################
resource "aws_vpc_endpoint" "ssm_endpoint_vpc_oregon" {
  vpc_id              = aws_vpc.vpc_01_oregon.id
  subnet_ids          = [aws_subnet.subnet01_vpc_oregon.id]
  service_name        = var.ssm_enpoint_1_vpc_oregon
  vpc_endpoint_type   = var.vpc_endpoint_ec2_type_vpc_oregon
  security_group_ids  = [aws_security_group.vpc_endpoints_vpc_oregon.id]
  private_dns_enabled = true

  provider = aws.oregon
}

#############################################################
# VPC endpoint to allow console access to the EC2 instances #
# in the source VPC                                         #
#############################################################
resource "aws_vpc_endpoint" "ssm_messages_vpc_oregon" {
  vpc_id              = aws_vpc.vpc_01_oregon.id
  subnet_ids          = [aws_subnet.subnet01_vpc_oregon.id]
  service_name        = var.ssm_enpoint_2_vpc_oregon
  vpc_endpoint_type   = var.vpc_endpoint_ec2_type_vpc_oregon
  security_group_ids  = [aws_security_group.vpc_endpoints_vpc_oregon.id]
  private_dns_enabled = true

  provider = aws.oregon
}

#############################################################
# VPC endpoint to allow console access to the EC2 instances #
# in the source VPC                                         #
#############################################################
resource "aws_vpc_endpoint" "ec2_messages_vpc_oregon" {
  vpc_id              = aws_vpc.vpc_01_oregon.id
  subnet_ids          = [aws_subnet.subnet01_vpc_oregon.id]
  service_name        = var.ssm_enpoint_3_vpc_oregon
  vpc_endpoint_type   = var.vpc_endpoint_ec2_type_vpc_oregon
  security_group_ids  = [aws_security_group.vpc_endpoints_vpc_oregon.id]
  private_dns_enabled = true

  provider = aws.oregon
}
