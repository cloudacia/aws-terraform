##########################################
# SSL certificate for the VPN endpoint   #
##########################################
resource "aws_acm_certificate" "web_server" {
  domain_name       = var.www_dns_record
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

####################################################
# Importing SSL/TLS certificate for VPN endpoint   #
####################################################
resource "aws_acm_certificate" "server-vpn-certificate" {
  private_key       = file("private_keys/servervpn01.cloudacia.net.key")
  certificate_body  = file("certificates/servervpn01.cloudacia.net.crt")
  certificate_chain = file("certificates/ca.crt")
}

####################################################
# Importing SSL/TLS certificate for VPN endpoint   #
####################################################
resource "aws_acm_certificate" "server-client-certificate" {
  private_key       = file("private_keys/clientvpn01.cloudacia.net.key")
  certificate_body  = file("certificates/clientvpn01.cloudacia.net.crt")
  certificate_chain = file("certificates/ca.crt")
}
