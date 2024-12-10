resource "aws_lb" "XGmedTokyo-TG01" {
  name               = "XGmedTokyo-TG01d-balancer"
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
    Name    = "XGmedTokyo-TG01Balancer"
    Service = "XGmedTokyo-TG01"  
    Owner   = "Crows"
    Project = "Web Service"
  }
}

resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.XGmedTokyo-TG01.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.XGmedTokyo-TG01.arn
  }
}

# data "aws_acm_certificate" "cert" {
#   domain   = "balerica-aisecops.com"
#   statuses = ["ISSUED"]
#   most_recent = true
# }


# resource "aws_lb_listener" "https" {
#   load_balancer_arn = aws_lb.XGmedTokyo-TG01.arn
#   port              = 443
#   protocol          = "HTTPS"
#   ssl_policy        = "ELBSecurityPolicy-2016-08"  # or whichever policy suits your requirements
#   certificate_arn   = data.aws_acm_certificate.cert.arn



#   default_action {
#     type             = "forward"
#     target_group_arn = aws_lb_target_group.XGmedTokyo-TG01.arn
#   }
# }

# output "lb_dns_name" {
#   value       = aws_lb.XGmedTokyo-TG01.dns_name
#   description = "The DNS name of the XGmedTokyo-TG01d Balancer."
#}
