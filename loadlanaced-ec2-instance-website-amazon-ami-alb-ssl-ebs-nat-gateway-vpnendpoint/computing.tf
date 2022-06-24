#################################################
# EC2 INSTANCE                                  #
#################################################
resource "aws_instance" "web01" {
  connection {
    type = "ssh"
    user = "ec2-user"
    host = self.private_ip
  }
  ami                         = var.aws_amis
  instance_type               = var.instance_type
  key_name                    = aws_key_pair.user_key.key_name
  vpc_security_group_ids      = [aws_security_group.web_and_ssh.id]
  subnet_id                   = aws_subnet.subnet03.id
  user_data                   = filebase64("script/script.sh")
  associate_public_ip_address = false

  metadata_options {
    http_endpoint = "enabled"
    http_tokens   = "optional"
  }

  root_block_device {
    delete_on_termination = true
    encrypted             = true
  }

  tags = {
    Name = "cloudacia"
  }
}

#################################################
# EC2 INSTANCE                                  #
#################################################
resource "aws_instance" "web02" {
  connection {
    type = "ssh"
    user = "ec2-user"
    host = self.private_ip
  }
  ami                         = var.aws_amis
  instance_type               = var.instance_type
  key_name                    = aws_key_pair.user_key.key_name
  vpc_security_group_ids      = [aws_security_group.web_and_ssh.id]
  subnet_id                   = aws_subnet.subnet04.id
  user_data                   = filebase64("script/script.sh")
  associate_public_ip_address = false

  metadata_options {
    http_endpoint = "enabled"
    http_tokens   = "optional"
  }

  root_block_device {
    delete_on_termination = true
    encrypted             = true
  }

  tags = {
    Name = "cloudacia"
  }
}
