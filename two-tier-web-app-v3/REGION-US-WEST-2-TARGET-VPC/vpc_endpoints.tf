#resource "aws_vpc_endpoint" "s3" {
#  vpc_id       = aws_vpc.staging.id
#  subnet_ids = aws_subnet.staging_vpc_subnet01
#  service_name = "com.amazonaws.us-west-2.s3"
#  vpc_endpoint_type = "Interface"
#  private_dns_enabled  = true
#}

#resource "aws_vpc_endpoint" "drs" {
#  vpc_id       = aws_vpc.staging.id
#  subnet_ids = aws_subnet.staging_vpc_subnet01.id
#  service_name = "com.amazonaws.us-west-2.drs"
#  vpc_endpoint_type = "Interface"
#  private_dns_enabled  = true
#}

#resource "aws_vpc_endpoint" "ec2" {
#  vpc_id       = aws_vpc.staging.id
#  subnet_ids = aws_subnet.staging_vpc_subnet01.id
#  service_name = "com.amazonaws.us-west-2.ec2"
#  vpc_endpoint_type = "Interface"
#  private_dns_enabled  = true
#}

#resource "aws_vpc_endpoint" "s3_gateway`" {
#  vpc_id       = aws_vpc.staging.id
#  subnet_ids = aws_subnet.staging_vpc_subnet01.id
#  service_name = "com.amazonaws.us-west-2.s3"
#  vpc_endpoint_type = "Gateway"
#  private_dns_enabled  = true
# route_table_ids = aws_route_table.staging_vpc_default_1.id
#}
