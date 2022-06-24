################################################
#  EC2 INSTANCE SECURITY GROUP                 #
################################################
resource "aws_security_group" "web_and_ssh" {
  name        = "web_and_ssh"
  description = "Allow web incgress trafic"
  vpc_id      = aws_vpc.cloudacia_vpc.id


  # http port
  ingress {
    description     = "Allow inbound HTTP traffic"
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    security_groups = [aws_security_group.alb.id]
  }

  # SSH port
  ingress {
    description = "Allow inbound SSH traffic"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Open access to public network
  egress {
    description = "Allow outbound ANY traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "cloudacia"
  }
}

#####################################
###  ALB SECURITY SECURITY GROUP    #
#####################################
resource "aws_security_group" "alb" {
  name        = "alb"
  description = "Allow incoming traffic to port 80 and 443 TCP"
  vpc_id      = aws_vpc.cloudacia_vpc.id
  tags = {
    Name = "ALB"
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

#####################################
###  Security Group for VPN endpoint
####################################

resource "aws_security_group" "client-vpn-access" {
  name   = "terraform-shared-client-vpn-access"
  vpc_id = aws_vpc.cloudacia_vpc.id

  ingress {
    from_port   = 0
    protocol    = "-1"
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    protocol    = "-1"
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
}
