################################
###  Cloudwatch Log Group
################################

resource "aws_cloudwatch_log_group" "cloudacia-cloudwatch-log-group" {
  name              = "cloudacia-client-vpn-endpoint"
  retention_in_days = "30"

  tags = {
    Name        = "cloudacia"
    Environment = "global"
    Terraform   = "true"
  }
}
