# this  makes  vpc.id which is aws_vpc.app1.id
resource "aws_vpc" "XGmedTokyo_VPC" {
  cidr_block = "10.98.0.0/16"

  tags = {
    Name = "XGmedTokyo_VPC"
    Service = "Armageddon"
    Owner = "Crows_Group"
    Goal = "Leave_Matrix"
  }
}
