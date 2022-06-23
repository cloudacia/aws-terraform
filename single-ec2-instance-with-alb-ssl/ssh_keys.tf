################################################
#  EC2 SSH KEYS                                #
################################################
resource "aws_key_pair" "user_key" {
  key_name   = "ec2_public_key_cloudacia"
  public_key = var.ssh_public_key

  tags = {
    Name = "cloudacia1"
  }
}
