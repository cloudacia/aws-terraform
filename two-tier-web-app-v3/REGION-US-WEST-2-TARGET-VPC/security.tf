resource "aws_security_group" "instance_1" {
  name        = "DRS-TARGET-VPC-INSTANCE-1"
  description = "Allows HTTP and SSH access"
  vpc_id      = aws_vpc.target.id

  ingress {
    description = "Allow SSH connection"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow MySQL connection"
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
    Name = "DRS-TARGET-VPC-INSTANCE-1"
  }
}

resource "aws_security_group" "vpc_endpoints" {
  name        = "SG for vpc_endpoints"
  description = "Allows 443/TCP, 53/UDP, 1500/TCP"
  vpc_id      = aws_vpc.staging.id

  ingress {
    description = "DRS Replication Port"
    from_port   = 1500
    to_port     = 1500
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "DRS Replication Port"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "DRS Replication Port"
    from_port   = 53
    to_port     = 53
    protocol    = "udp"
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
    Name = "VPC ENDPOINT SG"
  }
}
