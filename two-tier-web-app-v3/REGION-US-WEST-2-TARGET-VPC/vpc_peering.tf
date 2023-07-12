#resource "aws_vpc_peering_connection" "peering_vpc_sourse_to_vpc_staging" {
#  peer_vpc_id = aws_vpc.vpc_a.id
#  vpc_id      = aws_vpc.vpc_b.id
#  auto_accept = true

#  tags = {
#    Name = "VPC Peering between SOURCE and STAGING"
#  }
#}
