###############################################
#  AWS CLOUDFRONT DISTRIBUTION                #
###############################################
resource "aws_cloudfront_distribution" "alb_distribution" {
  depends_on = [
    aws_lb.alb01
  ]

  enabled = true
  aliases = [var.www_dns_record03]

  logging_config {
    include_cookies = false
    bucket          = aws_s3_bucket.cloudfront_bucket.bucket_domain_name
    prefix          = var.logs_prefix
  }

  origin {
    domain_name = aws_lb.alb01.dns_name
    origin_id   = aws_lb.alb01.id

    custom_origin_config {
      http_port                = "80"
      https_port               = "443"
      origin_protocol_policy   = "https-only"
      origin_ssl_protocols     = ["TLSv1", "TLSv1.1", "TLSv1.2"]
      origin_keepalive_timeout = "5"
      origin_read_timeout      = "30"
    }

    custom_header {
      name  = var.custom_header["key"]
      value = var.custom_header["value"]
    }
  }

  default_cache_behavior {
    allowed_methods  = ["DELETE", "GET", "HEAD", "OPTIONS", "PATCH", "POST", "PUT"]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = aws_lb.alb01.id
    forwarded_values {
      query_string = false
      headers      = ["Host"]
      cookies {
        forward = "none"
      }
    }
    viewer_protocol_policy = "redirect-to-https"
  }

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  viewer_certificate {
    acm_certificate_arn = aws_acm_certificate.certificate_asterisk.id
    ssl_support_method  = "vip"
    #cloudfront_default_certificate = true
  }
}
