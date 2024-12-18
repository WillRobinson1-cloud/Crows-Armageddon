resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.XGmedTokyo_VPC.id

  tags = {
    Name    = "XGmedTokyo_IGW"
    Service = "Armageddon"
    Owner   = "Crows_Class6"
    Goal    = "Leave_Matrix"
  }
}
