###############################################
#  AWS CLOUDFRONT DISTRIBUTION                #
###############################################
resource "aws_cloudfront_distribution" "alb_distribution" {
  depends_on = [
    aws_lb.alb01_vpc_virginia,
    aws_lb.alb01_vpc_oregon
  ]

  enabled = true
  aliases = ["www.cloudacia.net"]

  origin_group {
    origin_id = "DEMO-MULTI-REGION"

    failover_criteria {
      status_codes = [403, 404, 500, 502]
    }

    member {
      origin_id = aws_lb.alb01_vpc_virginia.id
    }

    member {
      origin_id = aws_lb.alb01_vpc_oregon.id
    }
  }

  origin {
    domain_name = aws_lb.alb01_vpc_virginia.dns_name
    origin_id   = aws_lb.alb01_vpc_virginia.id

    custom_origin_config {
      http_port                = "80"
      https_port               = "443"
      origin_protocol_policy   = "http-only"
      origin_ssl_protocols     = ["TLSv1", "TLSv1.1", "TLSv1.2"]
      origin_keepalive_timeout = "5"
      origin_read_timeout      = "30"
    }
  }

  origin {
    domain_name = aws_lb.alb01_vpc_oregon.dns_name
    origin_id   = aws_lb.alb01_vpc_oregon.id

    custom_origin_config {
      http_port                = "80"
      https_port               = "443"
      origin_protocol_policy   = "http-only"
      origin_ssl_protocols     = ["TLSv1", "TLSv1.1", "TLSv1.2"]
      origin_keepalive_timeout = "5"
      origin_read_timeout      = "30"
    }
  }

  default_cache_behavior {
    allowed_methods  = ["GET", "HEAD", "OPTIONS"]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = "DEMO-MULTI-REGION"
    forwarded_values {
      query_string = false
      cookies {
        forward = "none"
      }
    }
    viewer_protocol_policy = "allow-all"
  }

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  viewer_certificate {
    acm_certificate_arn            = aws_acm_certificate.web_server.id
    ssl_support_method             = "vip"
    cloudfront_default_certificate = true
  }
}
