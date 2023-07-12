###############################################
#  AWS RDS SUBNET GROUP SETTING               #
###############################################
resource "aws_db_subnet_group" "wordpress_db" {
  subnet_ids = [aws_subnet.subnet05.id,
  aws_subnet.subnet06.id]
}

###############################################
#  AWS RDS INSTANCE                           #
###############################################
resource "aws_db_instance" "wordpress_db" {
  allocated_storage      = 10
  engine                 = var.rds_engine
  engine_version         = var.rds_engine_version
  instance_class         = var.rds_instance_class
  db_name                = var.rds_db_name
  username               = var.rds_db_username
  password               = var.rds_db_password
  skip_final_snapshot    = true
  db_subnet_group_name   = aws_db_subnet_group.wordpress_db.id
  vpc_security_group_ids = [aws_security_group.mysql_sg.id]
  multi_az               = true
  storage_encrypted      = true
  kms_key_id             = aws_kms_key.wordpress_db_key.arn
}
