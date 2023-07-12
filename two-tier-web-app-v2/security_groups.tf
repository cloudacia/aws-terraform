###############################################
#  AWS SECURITY GROUP FOR EC2 INSTANCES       #
###############################################
resource "aws_security_group" "webserver" {
  name        = "webserver"
  description = "Allow incoming traffic to port 80/TCP"
  vpc_id      = aws_vpc.cloudacia_vpc.id
  tags = {
    Name = "webserver"
  }

  ingress {
    from_port = 80
    to_port   = 80
    protocol  = "tcp"
    #security_groups = [aws_security_group.elb.id]
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
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


###############################################
#  AWS SECURITY GROUP FOR THE LOAD BALANCER   #
###############################################
resource "aws_security_group" "elb" {
  name        = "alb"
  description = "Allow incoming traffic to port 80/TCP"
  vpc_id      = aws_vpc.cloudacia_vpc.id
  tags = {
    Name = "ALB"
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

###############################################
#  AWS SECURITY GROUP FOR EFS                 #
###############################################
resource "aws_security_group" "efs" {
  name        = "efs"
  description = "Allow incoming traffic to port 2049/TCP"
  vpc_id      = aws_vpc.cloudacia_vpc.id
  tags = {
    Name = "wordpress efs"
  }

  ingress {
    from_port   = 2049
    to_port     = 2049
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

###############################################
#  AWS SECURITY GROUP FOR RDS                 #
###############################################
resource "aws_security_group" "mysql_sg" {
  name        = "MySQL RDS"
  description = "Allow incoming traffic to port 3306/TCP"
  vpc_id      = aws_vpc.cloudacia_vpc.id
  tags = {
    Name = "mysql_sg"
  }

  ingress {
    from_port   = 3306
    to_port     = 3306
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

###############################################
#  AWS SECURITY GROUP FOR ELASTICACHE         #
###############################################
resource "aws_security_group" "elasticache" {
  name        = "elasticache"
  description = "Allow incoming traffic to port 6379/TCP"
  vpc_id      = aws_vpc.cloudacia_vpc.id
  tags = {
    Name = "elasticache"
  }

  ingress {
    from_port   = 6379
    to_port     = 6379
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
