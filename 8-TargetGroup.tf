resource "aws_lb_target_group" "XGmedTokyo_tg" {
  name     = "XGmedTokyo-target-group"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.XGmedTokyo_VPC.id
  target_type = "instance"

  health_check {
    enabled             = true
    interval            = 30
    path                = "/"
    protocol            = "HTTP"
    healthy_threshold   = 5
    unhealthy_threshold = 2
    timeout             = 5
    matcher             = "200"
  }

  tags = {
    Name    = "XGmedTokyoTargetGroup"
    Service = "XGmedTokyo"
    Owner   = "User"
    Project = "Web Service"
  }
}
