resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.XGmedTokyo_VPC.id

  tags = {
    Name    = "XGmedTokyo_VPC_IG"
    Service = "Armageddon"
    Owner   = "Crows"
    Goal    = "Leave_Matrix"
  }
}
