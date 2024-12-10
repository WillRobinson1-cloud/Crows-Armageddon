resource "aws_security_group" "XGmedTokyo-sg01-servers" {
  name        = "XGmedTokyo_VPC-sg01-servers"
  description = "XGmedTokyo_VPC-sg01-servers"
  vpc_id      = aws_vpc.XGmedTokyo_VPC.id

  ingress {
    description = "MyHomePage"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "ICMP"
    from_port   = 3389
    to_port     = 3389
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }


  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name    = "XGmedTokyo_VPC-sg01-servers"
    Service = "J-Tele-Doctor"
    Owner   = "Crows"
    Goal    = "Leave_Matrix"
  }

}





resource "aws_security_group" "XGmedTokyo-sg02-LB01" {
  name        = "XGmedTokyo_VPC-sg02-LB01"
  description = "XGmedTokyo_VPC-sg02-LB01"
  vpc_id      = aws_vpc.XGmedTokyo_VPC.id

  ingress {
    description = "Tokyo Midtown Medical Center"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name    = "XGmedTokyo_VPC-sg02-LB01"
    Service = "Load_Balancer"
    Owner   = "Crows"
    Goal    = "Leave_Matrix"
  }

}
