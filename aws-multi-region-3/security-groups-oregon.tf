##########################################################
# Security Group to be attached to the VPC endpoints for #
# SSM in the source VPC                                  #
##########################################################
resource "aws_security_group" "vpc_endpoints_vpc_oregon" {
  name        = "VPC-ENDPOINTS-SG"
  description = "Allows 443/TCP"
  vpc_id      = aws_vpc.vpc_01_oregon.id

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
    Name = "VPC-ENDPOINTS-SG"
  }

  provider = aws.oregon
}

##########################################################
# Security Group to be attached to an EC2 instance in    #
# the source VPC.                                        #
##########################################################
resource "aws_security_group" "web_server_01_vpc_oregon" {
  name        = "WEB-SERVER-01-SG"
  description = "Allows HTTP and SSH access from the internet"
  vpc_id      = aws_vpc.vpc_01_oregon.id

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
    Name = "WEB-SERVER-01-SG"
  }

  provider = aws.oregon
}

##########################################################
# Security Group to be attached to an EC2 instance in    #
# the source VPC.                                        #
##########################################################
resource "aws_security_group" "alb_01_vpc_oregon" {
  name        = "ALB-01-SG"
  description = "Allows HTTP from the internet"
  vpc_id      = aws_vpc.vpc_01_oregon.id

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
    Name = "ALB-01-SG"
  }

  provider = aws.oregon
}
