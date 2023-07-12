###############################################
#  LOCAL VARIABLES DECLARAITON                #
###############################################
locals {
  credentials = {
    httpd_root_dir  = var.httpd_root_dir
    file_system_dns = aws_efs_file_system.wordpress-efs.dns_name
  }
}

#################################################
# EC2 INSTANCE                                  #
#################################################
resource "aws_instance" "web01" {
  connection {
    type = "ssh"
    user = "centos"
    host = self.private_ip
  }
  ami                         = var.aws_amis
  instance_type               = var.instance_type
  key_name                    = aws_key_pair.ec2_public_key.key_name
  vpc_security_group_ids      = [aws_security_group.webserver.id]
  subnet_id                   = aws_subnet.subnet03.id
  user_data                   = base64encode(templatefile("bootstraping/script.sh", local.credentials))
  associate_public_ip_address = false
  private_ip                  = "10.0.3.5"
  iam_instance_profile        = aws_iam_instance_profile.instance_profile01.id

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

  depends_on = [
    aws_instance.bastion
  ]
}

#################################################
# EC2 INSTANCE                                  #
#################################################
resource "aws_instance" "web02" {
  connection {
    type = "ssh"
    user = "centos"
    host = self.private_ip
  }
  ami                         = var.aws_amis
  instance_type               = var.instance_type
  key_name                    = aws_key_pair.ec2_public_key.key_name
  vpc_security_group_ids      = [aws_security_group.webserver.id]
  subnet_id                   = aws_subnet.subnet04.id
  user_data                   = base64encode(templatefile("bootstraping/script.sh", local.credentials))
  associate_public_ip_address = false
  private_ip                  = "10.0.4.5"
  iam_instance_profile        = aws_iam_instance_profile.instance_profile01.id

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

  depends_on = [
    aws_instance.bastion
  ]
}
