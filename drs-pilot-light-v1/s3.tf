##########################################################
# An S3 bucket to store Apache's configuration file      #
##########################################################
resource "aws_s3_bucket" "source_vpc_bucket_01" {
  bucket = var.vpc_source_bucket_name
  acl    = var.vpc_source_bucket_acl

  tags = {
    Name = "rds-demo-for-customer-a"
  }

  provider = aws.virginia
}

##########################################################
# Restrict public access to a S3 bucket                  #
##########################################################
resource "aws_s3_bucket_public_access_block" "source_vpc_bucket_01_public_blocked" {
  bucket = aws_s3_bucket.source_vpc_bucket_01.id

  block_public_acls   = true
  block_public_policy = true
  ignore_public_acls  = true
  restrict_public_buckets = true
}

##########################################################
# Upload a local file into a S3 bucket                   #
##########################################################
resource "aws_s3_bucket_object" "rc_local_file" {
  bucket = aws_s3_bucket.source_vpc_bucket_01.id
  key    = var.vpc_source_object_key_1
  acl    = var.vpc_source_object_acl_1
  source = var.vpc_source_object_source_1
  
  provider = aws.virginia
}