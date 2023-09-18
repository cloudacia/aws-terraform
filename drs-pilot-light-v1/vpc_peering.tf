##################################################
# VPC peering connection between the Source VPC  #
# and the Staging VPC                            #
##################################################
resource "aws_vpc_peering_connection" "peering_vpc_source_to_vpc_staging" {
  peer_vpc_id = aws_vpc.staging.id
  vpc_id      = aws_vpc.source.id
  
  auto_accept = false
  peer_region = var.aws_peer_region

  tags = {
    Name = "drs-vpc-peering-sources-staging-vpc"
  }

  provider = aws.virginia
}

######################################################
# Accept the VPC peering connection initiated from   #
# the Source VPC into the Staging VPC                #
######################################################
resource "aws_vpc_peering_connection_accepter" "peer" {
  provider                  = "aws.oregon"
  vpc_peering_connection_id = aws_vpc_peering_connection.peering_vpc_source_to_vpc_staging.id
  auto_accept               = true  
}

######################################################
# Adding a route in the source VPC RT to reach the   #
# staging VPC CIDR range                             #
######################################################
resource "aws_route" "staging_vpc_network" {
  route_table_id            = aws_route_table.source_vpc_table_01.id
  destination_cidr_block    = var.staging_vpc_cidr
  vpc_peering_connection_id = aws_vpc_peering_connection.peering_vpc_source_to_vpc_staging.id
  depends_on                = [aws_vpc_peering_connection.peering_vpc_source_to_vpc_staging]

  provider = aws.virginia
}

######################################################
# Adding a route in the staging VPC RT to reach the  #
# source VPC CIDR range                              #
######################################################
resource "aws_route" "source_vpc_network" {
  route_table_id            = aws_route_table.staging_vpc_table_01.id
  destination_cidr_block    = var.source_vpc_cidr
  vpc_peering_connection_id = aws_vpc_peering_connection.peering_vpc_source_to_vpc_staging.id
  depends_on                = [aws_vpc_peering_connection.peering_vpc_source_to_vpc_staging]

  provider = aws.oregon
}

##################################################
# VPC peering connection between the target VPC  #
# and the staging VPC                            #
##################################################
resource "aws_vpc_peering_connection" "peering_vpc_target_to_vpc_staging" {
  peer_vpc_id = aws_vpc.staging.id
  vpc_id      = aws_vpc.target.id
  
  auto_accept = true  

  tags = {
    Name = "drs-vpc-peering-target-staging-vpc"
  }

  provider = aws.oregon
}

######################################################
# Adding a route in the staging VPC RT to reach the  #
# target VPC CIDR range                              #
######################################################
resource "aws_route" "staging_vpc_target" {
  route_table_id            = aws_route_table.staging_vpc_table_01.id
  destination_cidr_block    = var.target_vpc_cidr
  vpc_peering_connection_id = aws_vpc_peering_connection.peering_vpc_target_to_vpc_staging.id
  depends_on                = [aws_vpc_peering_connection.peering_vpc_target_to_vpc_staging]

  provider = aws.oregon
}

######################################################
# Adding a route in the target VPC RT to reach the   #
# staging VPC CIDR range                             #
######################################################
resource "aws_route" "target_vpc_staging" {
  route_table_id            = aws_route_table.target_vpc_table_01.id
  destination_cidr_block    = var.staging_vpc_cidr
  vpc_peering_connection_id = aws_vpc_peering_connection.peering_vpc_target_to_vpc_staging.id
  depends_on                = [aws_vpc_peering_connection.peering_vpc_target_to_vpc_staging]

  provider = aws.oregon
}

##################################################
# VPC peering connection between the target VPC  #
# and the source VPC                             #
##################################################
resource "aws_vpc_peering_connection" "peering_vpc_target_to_vpc_source" {
  peer_vpc_id = aws_vpc.source.id
  vpc_id      = aws_vpc.target.id
  
  auto_accept = false
  peer_region = "us-east-1"

  tags = {
    Name = "drs-vpc-peering-target-source-vpc"
  }

  provider = aws.oregon
}

######################################################
# Accept the VPC peering connection initiated from   #
# the target VPC into the source VPC                 #
######################################################
resource "aws_vpc_peering_connection_accepter" "peer_target_source" {
  provider                  = "aws.virginia"
  vpc_peering_connection_id = aws_vpc_peering_connection.peering_vpc_target_to_vpc_source.id
  auto_accept               = true  
}

######################################################
# Adding a route in the target VPC RT to reach the   #
# source VPC CIDR range                              #
######################################################
resource "aws_route" "target_vpc_source" {
  route_table_id            = aws_route_table.target_vpc_table_01.id
  destination_cidr_block    = var.source_vpc_cidr
  vpc_peering_connection_id = aws_vpc_peering_connection.peering_vpc_target_to_vpc_source.id
  depends_on                = [aws_vpc_peering_connection.peering_vpc_target_to_vpc_source]

  provider = aws.oregon
}

######################################################
# Adding a route in the source VPC RT to reach the   #
# target VPC CIDR range                              #
######################################################
resource "aws_route" "source_vpc_target" {
  route_table_id            = aws_route_table.source_vpc_table_01.id
  destination_cidr_block    = var.target_vpc_cidr
  vpc_peering_connection_id = aws_vpc_peering_connection.peering_vpc_target_to_vpc_source.id
  depends_on                = [aws_vpc_peering_connection.peering_vpc_target_to_vpc_source]

  provider = aws.virginia
}