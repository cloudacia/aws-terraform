##########################################################
# Security Group to be attached to an EC2 instance in    #
# the source VPC.                                        #
##########################################################
resource "aws_security_group" "ec2_instance_source_vpc" {
  name        = "drs-source-vpc-instance-1"
  description = "Allows HTTP and SSH access from the internet"
  vpc_id      = aws_vpc.source.id  

  ingress {
    description = "Allow HTTP connection"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Allow egress connection"
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "drs-source-vpc-instance-1"
  }

  provider = aws.virginia
}

##########################################################
# Security Group to be attached to an DB instance in the #
# source VPC.                                            #
##########################################################
resource "aws_security_group" "ec2_instance_wp_db" {
  name        = "drs-source-vpc-wp-db"
  description = "Allow MySQL connection"
  vpc_id      = aws_vpc.source.id

  ingress {
    description = "Allow MySQL connection"
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["10.1.0.0/16"]
  }  

  egress {
    description = "Allow egress connection"
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "drs-source-vpc-wp-db"
  }

  provider = aws.virginia
}

##########################################################
# Security Group to be attached to an DB instance in the #
# target VPC.                                            #
##########################################################
resource "aws_security_group" "ec2_instance_wp_db_target_vpc" {
  name        = "drs-target-vpc-wp-db"
  description = "Allow MySQL connection"
  vpc_id      = aws_vpc.target.id

  ingress {
    description = "Allow MySQL connection"
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["10.2.0.0/16"]
  }  

  egress {
    description = "Allow egress connection"
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "drs-target-vpc-wp-db"
  }

  provider = aws.oregon
}

##########################################################
# Security Group to be attached to an EC2 instance in    #
# the target VPC.                                        #
##########################################################
resource "aws_security_group" "ec2_instance_target_vpc" {
  name        = "drs-target-vpc-instance-1"
  description = "Allows HTTP and SSH access from the internet"
  vpc_id      = aws_vpc.target.id 

  ingress {
    description = "Allow HTTP connection"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Allow egress connection"
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "drs-target-vpc-instance-1"
  }

  provider = aws.oregon
}

##########################################################
# Security Group to be attached to the VPC endpoints in  #
# the staging VPC                                        #
##########################################################
resource "aws_security_group" "vpc_endpoints" {
  name        = "drs-staging-vpc-endpoints"
  description = "Allows 443/TCP, 53/UDP and 1500/TCP from source and staging vpcs"
  vpc_id      = aws_vpc.staging.id

  ingress {
    description = "Allow HTTPS connections"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow DNS connection"
    from_port   = 53
    to_port     = 53
    protocol    = "udp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow drs replication connection"
    from_port   = 1500
    to_port     = 1500
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Allow egress connection"
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "drs-staging-endpoint-drs"
  }

  provider = aws.oregon
}

##########################################################
# Security Group to be attached to the VPC endpoints for #
# SSM in the source VPC                                  #
##########################################################
resource "aws_security_group" "vpc_endpoints_virginia" {
  name        = "drs-virginia-vpc-endpoints"
  description = "Allows 443/TCP"
  vpc_id      = aws_vpc.source.id

  ingress {
    description = "Allow HTTPS connections"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Allow egress connection"
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "drs-source-endpoint-ssm"
  }

  provider = aws.virginia
}

##########################################################
# Security Group to be attached to the VPC endpoints for #
# SSM in the target VPC                                  #
##########################################################
resource "aws_security_group" "vpc_endpoints_oregon" {
  name        = "drs-oregon-vpc-endpoints"
  description = "Allows 443/TCP"
  vpc_id      = aws_vpc.target.id

  ingress {
    description = "Allow HTTPS connections"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Allow egress connection"
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "drs-target-endpoint-ssm"
  }

  provider = aws.oregon
}

##########################################################
# Security Group to be attached to the VPC endpoints in  #
# the source VPC                                         #
##########################################################
resource "aws_security_group" "vpc_drs_endpoints" {
  name        = "drs-source-vpc-endpoints"
  description = "Allows 443/TCP, 53/UDP and 1500/TCP from source and staging vpcs"
  vpc_id      = aws_vpc.source.id

  ingress {
    description = "Allow HTTPS connections"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow DNS connection"
    from_port   = 53
    to_port     = 53
    protocol    = "udp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow drs replication connection"
    from_port   = 1500
    to_port     = 1500
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Allow egress connection"
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "drs-source-vpc-endpoint"
  }

  provider = aws.virginia
}