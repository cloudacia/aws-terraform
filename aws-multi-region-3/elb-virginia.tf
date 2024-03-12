###############################################
#  AWS APPLICATION LOAD BALANCER              #
###############################################
resource "aws_lb" "alb01_vpc_virginia" {
  name                       = "ALB01-VPC-VIRGINIA"
  internal                   = false
  load_balancer_type         = "application"
  security_groups            = [aws_security_group.alb_01_vpc_virginia.id]
  subnets                    = [aws_subnet.subnet01_vpc_virginia.id, aws_subnet.subnet02_vpc_virginia.id]
  enable_deletion_protection = false

  provider = aws.virginia
}

#################################################
# APPLICATION LOAD BALANCER LISTENER TCP/HTTPS  #
#################################################
resource "aws_alb_listener" "alb_listener_https_vpc_virginia" {
  load_balancer_arn = aws_lb.alb01_vpc_virginia.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_alb_target_group.alb_tg_vpc_virginia.arn
  }

  provider = aws.virginia
}

###############################################
#  AWS ALB TARGET GROUP                       #
###############################################
resource "aws_alb_target_group" "alb_tg_vpc_virginia" {
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.vpc_01_virginia.id

  health_check {
    protocol            = "HTTP"
    path                = "/"
    port                = "traffic-port"
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 5
    interval            = 10
    matcher             = "200"
  }

  provider = aws.virginia
}

################################################
#  ATTACH EC2 INSTANCES TO ALB                 #
################################################
resource "aws_lb_target_group_attachment" "web_server01_vpc_virginia" {
  target_group_arn = aws_alb_target_group.alb_tg_vpc_virginia.arn
  target_id        = aws_instance.webs_server_01_vpc_virginia.id
  port             = 80

  provider = aws.virginia
}
