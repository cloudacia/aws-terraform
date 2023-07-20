resource "aws_s3_bucket" "source_vpc_bucket_01" {
  bucket = var.vpc_source_bucket_name
  acl    = var.vpc_source_bucket_acl

  tags = {
    Name = "rds-demo-cencosud"
  }

  provider = aws.virginia
}

resource "aws_s3_bucket_server_side_encryption_configuration" "source_vpc_bucket_01_encryption" {
  bucket = aws_s3_bucket.source_vpc_bucket_01.bucket

   rule {
     apply_server_side_encryption_by_default {
       kms_master_key_id = aws_kms_key.kms-virginia-key.arn
       sse_algorithm     = "aws:kms"
     }
   }
 }

 resource "aws_s3_bucket_versioning" "source_vpc_bucket_01_versioning" {
  bucket = aws_s3_bucket.source_vpc_bucket_01.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_public_access_block" "source_vpc_bucket_01_public_blocked" {
  bucket = aws_s3_bucket.source_vpc_bucket_01.id

  block_public_acls   = true
  block_public_policy = true
  ignore_public_acls  = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_object" "rc_local_file" {
  bucket = aws_s3_bucket.source_vpc_bucket_01.id
  key    = var.vpc_source_object_key_1
  acl    = var.vpc_source_object_acl_1
  source = var.vpc_source_object_source_1
  kms_key_id = aws_kms_key.kms-virginia-key.arn

  provider = aws.virginia
}