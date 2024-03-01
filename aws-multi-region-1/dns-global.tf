#######################################################
# GET DATA FROM AN AWS ROUTE53 ZONE                   #
#######################################################
data "aws_route53_zone" "cloudacia" {
  name         = var.domain_name
  private_zone = false

  provider = aws.virginia
}

###############################################
#  AWS ROUTE53 CNAME RECORD                   #
###############################################
resource "aws_route53_record" "www_virginia" {
  zone_id = data.aws_route53_zone.cloudacia.zone_id
  name    = "www.${data.aws_route53_zone.cloudacia.name}"
  type    = "A"
  ttl     = 60
  records = [aws_instance.webs_server_01_vpc_virginia.public_ip]

  provider = aws.virginia
}

###############################################
#  AWS ROUTE53 CNAME RECORD                   #
###############################################
resource "aws_route53_record" "www_virginia_1" {
  zone_id = data.aws_route53_zone.cloudacia.zone_id
  name    = data.aws_route53_zone.cloudacia.name
  type    = "A"
  ttl     = 60
  records = [aws_instance.webs_server_01_vpc_virginia.public_ip]

  provider = aws.virginia
}
