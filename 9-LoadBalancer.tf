resource "aws_lb" "XGmedTokyo_alb" {
  name               = "XGmedTokyo-load-balancer"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.XGmedTokyo-sg02-LB01.id]
  subnets            = [
    aws_subnet.public-ap-northeast-1a.id,
    aws_subnet.public-ap-northeast-1c.id,
    aws_subnet.public-ap-northeast-1d.id
  ]
  enable_deletion_protection = false
#Lots of death and suffering here, make sure it's false

  tags = {
    Name    = "XGmedTokyoLoadBalancer"
    Service = "XGmedTokyo"
    Owner   = "User"
    Project = "Web Service"
  }
}


resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.XGmedTokyo_alb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.XGmedTokyo_tg.arn
  }
}

/* This is for the HTTPS Listener
data "aws_acm_certificate" "cert" {
  domain   = "balerica-aisecops.com"
  statuses = ["ISSUED"]
  most_recent = true
}


resource "aws_lb_listener" "https" {
  load_balancer_arn = aws_lb.XGmedTokyo_alb.arn
  port              = 443
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-2016-08"  # or whichever policy suits your requirements
  certificate_arn   = data.aws_acm_certificate.cert.arn



  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.XGmedTokyo_tg.arn
  }
}
*/
output "lb_dns_name" {
  value       = aws_lb.XGmedTokyo_alb.dns_name
  description = "The DNS name of the XGmedTokyo Load Balancer."
}