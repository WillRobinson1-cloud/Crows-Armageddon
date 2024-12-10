resource "aws_lb_target_group" "XGmedTokyo-TG01" {
  name     = "XGmedTokyo-TG01"
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
    Name    = "XGmedTokyo-TG01"
    Service = "J-Tele-Doctor"
    Owner   = "Crows"
    Project = "Armageddon"
  }
}
