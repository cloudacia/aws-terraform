###############################################
#  AWS S3 BUCKET BOOTSTRAPPING EC2            #
###############################################
resource "aws_s3_bucket" "bucket01" {
  bucket = "cloudacia-apache-conf"
  tags = {
    Name = "Wordpress"
  }
}

###############################################
#  AWS S3 BUCKET CLOUDFRONT LOGGING           #
###############################################
resource "aws_s3_bucket" "cloudfront_bucket" {
  bucket        = "cloudacia-cloudfront-logs"
  force_destroy = true
  tags = {
    Name = "Wordpress"
  }
}

###############################################
#  AWS S3 BUCKET ELB LOGGING                 #
###############################################
resource "aws_s3_bucket" "elb_bucket" {
  bucket = "cloudacia-elb-logs"
  tags = {
    Name = "Wordpress"
  }
}

###############################################
#  AWS S3 ENCRYPTION                          #
###############################################
resource "aws_s3_bucket_server_side_encryption_configuration" "bucket01_encryption" {
  bucket = aws_s3_bucket.bucket01.id

  rule {
    apply_server_side_encryption_by_default {
      kms_master_key_id = aws_kms_key.s3_key.arn
      sse_algorithm     = "aws:kms"
    }
  }
}

###############################################
#  AWS S3 VERSIONING                          #
###############################################
resource "aws_s3_bucket_versioning" "bucket01_version" {
  bucket = aws_s3_bucket.bucket01.id
  versioning_configuration {
    status = "Enabled"
  }
}

###############################################
#  AWS S3 ACL                                 #
###############################################
resource "aws_s3_bucket_acl" "acl01" {
  bucket = aws_s3_bucket.bucket01.id
  acl    = "private"
}

###############################################
#  AWS S3 ACL                                 #
###############################################
resource "aws_s3_bucket_acl" "acl02" {
  bucket = aws_s3_bucket.cloudfront_bucket.id
  acl    = "private"
}

###############################################
#  AWS S3 ACL                                 #
###############################################
resource "aws_s3_bucket_acl" "acl03" {
  bucket = aws_s3_bucket.elb_bucket.id
  acl    = "private"
}


###############################################
#  AWS UPLOAD FILE TO S3 BUCKET               #
###############################################
resource "aws_s3_object" "object01" {
  bucket = aws_s3_bucket.bucket01.id
  key    = "httpd.conf"
  acl    = "private"
  source = "files/httpd.conf"
}
