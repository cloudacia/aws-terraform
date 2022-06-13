
# AWS LAUNCH CONFIGURATION
resource "aws_launch_configuration" "as_conf01" {
  name_prefix     = "web_config"
  image_id        = var.aws_amis
  instance_type   = var.instance_type
  key_name        = aws_key_pair.ec2_public_key.id
  security_groups = [aws_security_group.webserver.id]
  user_data       = filebase64("bootstrap_scripts/script.sh")

  root_block_device {
    delete_on_termination = true
  }
}
