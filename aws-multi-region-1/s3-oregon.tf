##########################################################
# An S3 bucket to store Apache's configuration file      #
##########################################################
resource "aws_s3_bucket" "bucket_02_oregon" {
  bucket = var.vpc_source_bucket_name_oregon
  acl    = var.vpc_source_bucket_acl_oregon

  tags = {
    Name = "AWS MULTI-REGION DEMO"
  }

  provider = aws.oregon
}

##########################################################
# Restrict public access to a S3 bucket                  #
##########################################################
resource "aws_s3_bucket_public_access_block" "bucket_01_public_blocked_oregon" {
  bucket = aws_s3_bucket.bucket_02_oregon.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true

  provider = aws.oregon
}

##########################################################
# Upload a local file into a S3 bucket                   #
##########################################################
resource "aws_s3_bucket_object" "rc_local_file_oregon" {
  bucket = aws_s3_bucket.bucket_01.id
  key    = var.vpc_source_object_key_1
  acl    = var.vpc_source_object_acl_1
  source = var.vpc_source_object_source_1

  provider = aws.virginia
}
