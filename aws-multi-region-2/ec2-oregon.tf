##########################################################
# An EC2 instance for a simple web application demo      #
##########################################################
resource "aws_instance" "webs_server_01_vpc_oregon" {
  ami                         = var.aws_amis_oregon
  instance_type               = var.instance_type
  vpc_security_group_ids      = [aws_security_group.web_server_01_vpc_oregon.id]
  subnet_id                   = aws_subnet.subnet03_vpc_oregon.id
  user_data                   = filebase64("scripts-oregon/bootstrap.sh")
  associate_public_ip_address = false
  iam_instance_profile        = aws_iam_instance_profile.web_server_01.id
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
    Name = "WEB-SERVER-01-OREGON"
  }

  provider = aws.oregon
}
