####################################################
# Get data about the DNS record                    #
####################################################
data "aws_route53_zone" "selected" {
  name         = var.domain_name
  private_zone = false
}

####################################################
# Creating DNS record www.cloudacia.net            #
####################################################
resource "aws_route53_record" "www" {
  zone_id = data.aws_route53_zone.selected.zone_id
  name    = "www.${data.aws_route53_zone.selected.name}"
  type    = "A"

  alias {
    name                   = aws_lb.alb01.dns_name
    zone_id                = aws_lb.alb01.zone_id
    evaluate_target_health = true
  }
}
