resource "aws_security_group" "XGmedTokyo-sg01-servers" {
  name        = "XGmedTokyo-sg01-servers"
  description = "XGmedTokyo-sg01-servers"
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
    description = "MyEvilBox"
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
    Name    = "XGmedTokyo-sg01-servers"
    Service = "Armageddon"
    Owner   = "Crows_Class6"
    Goal    = "Leave_Matrix"
  }

}





resource "aws_security_group" "XGmedTokyo-sg02-LB01" {
  name        = "XGmedTokyo-sg02-LB01"
  description = "XGmedTokyo-sg02-LB01"
  vpc_id      = aws_vpc.XGmedTokyo_VPC.id

  ingress {
    description = "MyHomePage"
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
    Name    = "XGmedTokyo-sg02-LB01"
    Service = "Armageddon"
    Owner   = "Crows_Class6"
    Goal    = "Leave_Matrix"
  }

}
