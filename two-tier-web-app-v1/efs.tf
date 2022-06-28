###############################################
#  ELASTIC FILESYSTEM                         #
###############################################
resource "aws_efs_file_system" "wordpress-efs" {
  creation_token   = "wordpress-efs"
  encrypted        = true
  kms_key_id       = aws_kms_key.efs_key.arn
  performance_mode = "generalPurpose"

  tags = {
    Name = "cloudacia"
  }
}

###############################################
#  EFS MOUNT TARGET #1                        #
###############################################
resource "aws_efs_mount_target" "wordpress-efs-target-1" {
  file_system_id  = aws_efs_file_system.wordpress-efs.id
  subnet_id       = aws_subnet.subnet07.id
  security_groups = [aws_security_group.efs.id]
}

###############################################
#  EFS MOUNT TARGET #2                        #
###############################################
resource "aws_efs_mount_target" "wordpress-efs-target-2" {
  file_system_id  = aws_efs_file_system.wordpress-efs.id
  subnet_id       = aws_subnet.subnet08.id
  security_groups = [aws_security_group.efs.id]
}
