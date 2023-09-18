##########################################################
# An EC2 instance for a simple web application demo      #
##########################################################
resource "aws_instance" "source_vpc_ec2_instance_1" {
  connection {
    type = "ssh"
    user = "ec2-user"
    host = self.public_ip
  }
  ami                         = var.aws_amis
  instance_type               = var.instance_type
  vpc_security_group_ids      = [aws_security_group.ec2_instance_source_vpc.id]
  subnet_id                   = aws_subnet.source_vpc_subnet_01.id
  user_data                   = filebase64("scripts/bootstrap.sh")
  associate_public_ip_address = true
  iam_instance_profile        = aws_iam_instance_profile.ec2_source_instance_profile_01.id
  monitoring                  = true


  metadata_options {
    http_endpoint = "enabled"
    http_tokens   = "optional"
  }

  root_block_device {
    delete_on_termination = true
    encrypted             = true
  }

  tags = {
    Name = "drs-ec2-source-vpc-01"
  }
  
  provider = aws.virginia
}

##########################################################
# An EC2 instance to install Wordpress                   #
##########################################################
resource "aws_instance" "source_vpc_ec2_wp_web" {
  connection {
    type = "ssh"
    user = "ec2-user"
    host = self.public_ip
  }
  ami                         = var.aws_amis
  instance_type               = var.instance_type
  vpc_security_group_ids      = [aws_security_group.ec2_instance_source_vpc.id]
  subnet_id                   = aws_subnet.source_vpc_subnet_01.id
  associate_public_ip_address = true
  iam_instance_profile        = aws_iam_instance_profile.ec2_source_instance_profile_01.id
  monitoring                  = true


  metadata_options {
    http_endpoint = "enabled"
    http_tokens   = "optional"
  }

  root_block_device {
    delete_on_termination = true
    encrypted             = true
  }

  tags = {
    Name = "drs-ec2-wp-web-vpc-01"
  }
  
  provider = aws.virginia
}

##########################################################
# An EC2 instance to install MariaDB                     #
##########################################################
resource "aws_instance" "source_vpc_ec2_db_web" {
  connection {
    type = "ssh"
    user = "ec2-user"
    host = self.public_ip
  }
  ami                         = var.aws_amis
  instance_type               = var.instance_type
  vpc_security_group_ids      = [aws_security_group.ec2_instance_wp_db.id]
  subnet_id                   = aws_subnet.source_vpc_subnet_01.id
  associate_public_ip_address = true
  iam_instance_profile        = aws_iam_instance_profile.ec2_source_instance_profile_01.id
  monitoring                  = true


  metadata_options {
    http_endpoint = "enabled"
    http_tokens   = "optional"
  }

  root_block_device {
    delete_on_termination = true
    encrypted             = true
  }

  tags = {
    Name = "drs-ec2-wp-db-vpc-01"
  }
  
  provider = aws.virginia
}
