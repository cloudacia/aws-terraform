resource "aws_acm_certificate" "certificate_asterisk" {
  domain_name       = var.ssl_certificate_01
  validation_method = "DNS"

  tags = {
    Name = "DEMO-DR-MR-INSTANCE-02"
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_acm_certificate_validation" "certificate_asterisk_validation" {
  timeouts {
    create = "5m"
  }
  certificate_arn         = aws_acm_certificate.certificate_asterisk.arn
  validation_record_fqdns = [for record in aws_route53_record.cert_validation_record01 : record.fqdn]
}
