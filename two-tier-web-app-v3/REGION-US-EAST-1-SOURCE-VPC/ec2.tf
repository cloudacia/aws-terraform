resource "aws_instance" "ec2_instance_1" {
  connection {
    type = var.instance_connection_type
    user = var.instance_username
    host = self.public_ip
  }
  ami                         = var.aws_amis
  instance_type               = var.instance_type
  key_name                    = aws_key_pair.this.key_name
  vpc_security_group_ids      = [aws_security_group.instance_1.id]
  subnet_id                   = aws_subnet.subnet01.id
  user_data                   = filebase64("scripts/bootstrap.sh")
  associate_public_ip_address = var.ec2_associate_public_ip_address
  iam_instance_profile        = aws_iam_instance_profile.instance_profile01.id


  metadata_options {
    http_endpoint = var.ec2_metadata_option[0]
    http_tokens   = var.ec2_metadata_option[1]
  }

  root_block_device {
    delete_on_termination = var.ec2_root_block_device[0]
    encrypted             = var.ec2_root_block_device[1]
  }

  tags = {
    Name = "DEMO-DR-MR-INSTANCE-01"
  }
}
