resource "aws_key_pair" "ec2_instance_source_vpc" {
  key_name   = var.ec2_instance_ssh_key_name
  public_key = var.ec2_instance_ssh_key_value

  provider = aws.virginia
}

resource "aws_key_pair" "ec2_instance_target_vpc" {
  key_name   = var.ec2_instance_ssh_key_name
  public_key = var.ec2_instance_ssh_key_value

  provider = aws.oregon
}