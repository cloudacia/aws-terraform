##########################################
# SSL certificate for the VPN endpoint   #
##########################################
resource "aws_acm_certificate" "web_server" {
  domain_name       = "www.cloudacia.net"
  validation_method = "DNS"

  tags = {
    Name = "cloudacia"
  }

  lifecycle {
    create_before_destroy = true
  }
}

#################################################
# Kick off SSL server certificate validation    #
#################################################
resource "aws_acm_certificate_validation" "web_server_validation" {
  timeouts {
    create = "5m"
  }
  certificate_arn         = aws_acm_certificate.web_server.arn
  validation_record_fqdns = [for record in aws_route53_record.cert_validation_record : record.fqdn]
}
