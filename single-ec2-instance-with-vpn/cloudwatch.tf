################################
###  Cloudwatch Log Group
################################

resource "aws_cloudwatch_log_group" "cloudwatch-log-group" {
  name              = "client-vpn-endpoint-cloudacia"
  retention_in_days = "30"

  tags = {
    Name        = "cloudacia"
    Environment = "global"
    Terraform   = "true"
  }
}
