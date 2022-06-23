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
