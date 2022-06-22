##########################################
# SSL certificate for the VPN endpoint   #
##########################################

resource "aws_acm_certificate" "vpn_server" {
  domain_name       = "vpn.cloudacia.net"
  validation_method = "DNS"

  tags = {
    Name = "cloudacia_vpn"
  }

  lifecycle {
    create_before_destroy = true
  }
}

#################################################
# Kick off SSL server certificate validation    #
#################################################

resource "aws_acm_certificate_validation" "server_validation" {
  timeouts {
    create = "5m"
  }
  certificate_arn         = aws_acm_certificate.vpn_server.arn
  validation_record_fqdns = [for record in aws_route53_record.cert_validation_record : record.fqdn]
}


##########################################
# SSL certificate for the clients        #
##########################################

resource "aws_acm_certificate" "vpn_client" {
  domain_name       = "vpnclient.cloudacia.net"
  validation_method = "DNS"

  tags = {
    Name = "cloudacia_vpn"
  }

  lifecycle {
    create_before_destroy = true
  }
}

#################################################
# Kick off SSL client certificate validation    #
#################################################

resource "aws_acm_certificate_validation" "client_validation" {
  timeouts {
    create = "5m"
  }
  certificate_arn         = aws_acm_certificate.vpn_client.arn
  validation_record_fqdns = [for record in aws_route53_record.cert_validation_record_vpn_client : record.fqdn]
}
