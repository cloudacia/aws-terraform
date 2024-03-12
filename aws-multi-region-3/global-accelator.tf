###############################################
#  AWS GLOBAL ACCELATOR                       #
###############################################

resource "aws_globalaccelerator_accelerator" "cloudacia-net" {
  name            = "cloudacia-net"
  ip_address_type = "IPV4"
  #ip_addresses    = ["1.2.3.4"]
  enabled = true

  #attributes {
  #  flow_logs_enabled   = true
  #  flow_logs_s3_bucket = "example-bucket"
  #  flow_logs_s3_prefix = "flow-logs/"
  #}
}

###############################################
#  AWS GLOBAL ACCELATOR LISTENER              #
###############################################
resource "aws_globalaccelerator_listener" "cloudacia-net" {
  accelerator_arn = aws_globalaccelerator_accelerator.cloudacia-net.id
  client_affinity = "SOURCE_IP"
  protocol        = "TCP"

  port_range {
    from_port = 80
    to_port   = 80
  }
}

###############################################
#  AWS GLOBAL ACCELATOR ENDPOINTS             #
###############################################
resource "aws_globalaccelerator_endpoint_group" "virginia" {
  listener_arn                  = aws_globalaccelerator_listener.cloudacia-net.id
  endpoint_group_region         = "us-east-1"
  threshold_count               = 1
  health_check_interval_seconds = 10

  endpoint_configuration {
    endpoint_id = aws_lb.alb01_vpc_virginia.arn
    weight      = 100
  }
}

###############################################
#  AWS GLOBAL ACCELATOR ENDPOINTS             #
###############################################
resource "aws_globalaccelerator_endpoint_group" "oregon" {
  listener_arn                  = aws_globalaccelerator_listener.cloudacia-net.id
  endpoint_group_region         = "us-west-2"
  threshold_count               = 1
  health_check_interval_seconds = 10

  endpoint_configuration {
    endpoint_id = aws_lb.alb01_vpc_oregon.arn
    weight      = 100
  }
}
