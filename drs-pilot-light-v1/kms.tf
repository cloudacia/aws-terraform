resource "aws_kms_key" "kms-virginia-key" {
  description             = "drs-ec2-source-key"
  enable_key_rotation    = true
  deletion_window_in_days = 10

  tags = {
    Name = "drs-kms-source-vpc-01"
  }
}