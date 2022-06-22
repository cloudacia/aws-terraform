#################################################
# Get DNS zone information about cloudacia.net  #
#################################################

data "aws_route53_zone" "zone" {
  name         = "cloudacia.net."
  private_zone = false
}

#######################################################
# CNAME record for validating server SSL certificate  #
#######################################################

resource "aws_route53_record" "cert_validation_record" {
  for_each = {
    for dvo in aws_acm_certificate.vpn_server.domain_validation_options : dvo.domain_name => {
      name   = dvo.resource_record_name
      record = dvo.resource_record_value
      type   = dvo.resource_record_type
    }
  }

  allow_overwrite = true
  name            = each.value.name
  records         = [each.value.record]
  ttl             = 300
  type            = each.value.type
  zone_id         = data.aws_route53_zone.zone.zone_id
}

#######################################################
# CNAME record for validating client SSL certificate  #
#######################################################

resource "aws_route53_record" "cert_validation_record_vpn_client" {
  for_each = {
    for dvo in aws_acm_certificate.vpn_client.domain_validation_options : dvo.domain_name => {
      name   = dvo.resource_record_name
      record = dvo.resource_record_value
      type   = dvo.resource_record_type
    }
  }

  allow_overwrite = true
  name            = each.value.name
  records         = [each.value.record]
  ttl             = 300
  type            = each.value.type
  zone_id         = data.aws_route53_zone.zone.zone_id
}
