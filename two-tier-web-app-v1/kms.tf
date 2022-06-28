resource "aws_kms_key" "wordpress_db_key" {
  description             = "RDS encryption/decryption key"
  key_usage               = "ENCRYPT_DECRYPT"
  deletion_window_in_days = 10
  is_enabled              = true
  enable_key_rotation     = true

  tags = {
    Name = "cloudacia"
  }
}

resource "aws_kms_key" "efs_key" {
  description             = "EFS encryption/decryption key"
  key_usage               = "ENCRYPT_DECRYPT"
  deletion_window_in_days = 10
  is_enabled              = true
  enable_key_rotation     = true

  tags = {
    Name = "cloudacia"
  }
}

resource "aws_kms_key" "redis_key" {
  description             = "REDIS encryption/decryption key"
  key_usage               = "ENCRYPT_DECRYPT"
  deletion_window_in_days = 10
  is_enabled              = true
  enable_key_rotation     = true

  tags = {
    Name = "cloudacia"
  }
}
