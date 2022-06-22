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
    for dvo in aws_acm_certificate.web_server.domain_validation_options : dvo.domain_name => {
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
# GET DATA FROM AN AWS ROUTE53 ZONE                   #
#######################################################

data "aws_route53_zone" "selected" {
  name         = var.domain_name
  private_zone = false
}

#######################################################
# ADD DNS RECORD TYPE A                               #
#######################################################

resource "aws_route53_record" "www" {
  zone_id = data.aws_route53_zone.selected.zone_id
  name    = "www.${data.aws_route53_zone.selected.name}"
  type    = "A"

  alias {
    name                   = aws_lb.alb01.dns_name
    zone_id                = aws_lb.alb01.zone_id
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "www2" {
  zone_id = data.aws_route53_zone.selected.zone_id
  name    = data.aws_route53_zone.selected.name
  type    = "A"

  alias {
    name                   = aws_lb.alb01.dns_name
    zone_id                = aws_lb.alb01.zone_id
    evaluate_target_health = false
  }
}
