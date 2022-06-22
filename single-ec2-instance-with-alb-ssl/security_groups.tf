################################
###  Security Group for ec2
################################
resource "aws_security_group" "web_and_ssh" {
  name        = "web_and_ssh"
  description = "Allow web incgress trafic"
  vpc_id      = aws_vpc.cloudacia_vpc.id


  # http port
  ingress {
    description = "Allow inbound HTTP traffic"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # https port
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

################################
###  Security Group for ALB    #
################################

# AWS SECURITY GROUP FOR THE LOAD BALANCER
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