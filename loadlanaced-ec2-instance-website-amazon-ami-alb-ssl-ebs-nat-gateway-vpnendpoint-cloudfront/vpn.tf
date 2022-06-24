#################################################
# VPN endpoint                                  #
#################################################
resource "aws_ec2_client_vpn_endpoint" "cloudacia-vpn-endpoint" {
  description            = "terraform-clientvpn-example"
  server_certificate_arn = aws_acm_certificate.server-vpn-certificate.arn
  client_cidr_block      = "172.16.0.0/16"
  split_tunnel           = true

  tags = {
    Name = "cloudacia-vpn-terraform"
  }

  authentication_options {
    type                       = "certificate-authentication"
    root_certificate_chain_arn = aws_acm_certificate.server-client-certificate.arn
  }

  connection_log_options {
    enabled              = true
    cloudwatch_log_group = aws_cloudwatch_log_group.cloudacia-cloudwatch-log-group.name
  }
}

#################################################
# VPN endpoint subnet association               #
#################################################
resource "aws_ec2_client_vpn_network_association" "vpn_asoc_subnet01" {
  client_vpn_endpoint_id = aws_ec2_client_vpn_endpoint.cloudacia-vpn-endpoint.id
  subnet_id              = aws_subnet.subnet01.id
  security_groups        = [aws_security_group.client-vpn-access.id]
}

#################################################
# VPN endpoint subnet association               #
#################################################
resource "aws_ec2_client_vpn_network_association" "vpn_asoc_subnet02" {
  client_vpn_endpoint_id = aws_ec2_client_vpn_endpoint.cloudacia-vpn-endpoint.id
  subnet_id              = aws_subnet.subnet02.id
  security_groups        = [aws_security_group.client-vpn-access.id]
}


#################################################
# VPN endpoint rule authorization               #
#################################################
resource "aws_ec2_client_vpn_authorization_rule" "vpn_auth_subnet03" {
  client_vpn_endpoint_id = aws_ec2_client_vpn_endpoint.cloudacia-vpn-endpoint.id
  target_network_cidr    = aws_subnet.subnet03.cidr_block
  authorize_all_groups   = true
}

#################################################
# VPN endpoint rule authorization               #
#################################################
resource "aws_ec2_client_vpn_authorization_rule" "vpn_auth_subnet04" {
  client_vpn_endpoint_id = aws_ec2_client_vpn_endpoint.cloudacia-vpn-endpoint.id
  target_network_cidr    = aws_subnet.subnet04.cidr_block
  authorize_all_groups   = true
}
