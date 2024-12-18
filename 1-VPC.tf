# this  makes  vpc.id which is aws_vpc.XGmedTokyo.id
resource "aws_vpc" "XGmedTokyo_VPC" {
  cidr_block = "10.99.0.0/16"

  tags = {
    Name = "XGmedTokyo_VPC"
    Service = "Armageddon"
    Owner = "Crows_Class6"
    Goal = "Leave_Matrix"
  }
}
