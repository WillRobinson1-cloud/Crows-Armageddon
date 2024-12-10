#These are   for  public

resource "aws_subnet" "public-ap-northeast-1a" {
  vpc_id                  = aws_vpc.XGmedTokyo_VPC.id
  cidr_block              = "10.98.1.0/24"
  availability_zone       = "ap-northeast-1a"
  map_public_ip_on_launch = true

  tags = {
    Name    = "public-ap-northeast-1a"
    Service = "Armageddon"
    Owner   = "Crows"
    Goal    = "Leave_Matrix"
  }
}

resource "aws_subnet" "public-ap-northeast-1c" {
  vpc_id                  = aws_vpc.XGmedTokyo_VPC.id
  cidr_block              = "10.98.3.0/24"
  availability_zone       = "ap-northeast-1c"
  map_public_ip_on_launch = true

  tags = {
    Name    = "public-ap-northeast-1c"
    Service = "Armageddon"
    Owner   = "Crows"
    Goal    = "Leave_Matrix"
  }
}


resource "aws_subnet" "public-ap-northeast-1d" {
  vpc_id                  = aws_vpc.XGmedTokyo_VPC.id
  cidr_block              = "10.98.5.0/24"
  availability_zone       = "ap-northeast-1d"
  map_public_ip_on_launch = true

  tags = {
    Name    = "public-ap-northeast-1d"
    Service = "Armageddon"
    Owner   = "Crows"
    Goal  = "Leave_Matrix"
  }
}

#these are for private
resource "aws_subnet" "private-ap-northeast-1a" {
  vpc_id            = aws_vpc.XGmedTokyo_VPC.id
  cidr_block        = "10.98.11.0/24"
  availability_zone = "ap-northeast-1a"

  tags = {
    Name    = "private-ap-northeast-1a"
    Service = "Armageddon"
    Owner   = "Crows"
    Goal  = "Leave_Matrix"
  }
}

resource "aws_subnet" "private-ap-northeast-1c" {
  vpc_id            = aws_vpc.XGmedTokyo_VPC.id
  cidr_block        = "10.98.13.0/24"
  availability_zone = "ap-northeast-1c"

  tags = {
    Name    = "private-ap-northeast-1c"
    Service = "Armageddon"
    Owner   = "Crows"
    Goal  = "Leave_Matrix"
  }
}


resource "aws_subnet" "private-ap-northeast-1d" {
  vpc_id            = aws_vpc.XGmedTokyo_VPC.id
  cidr_block        = "10.98.15.0/24"
  availability_zone = "ap-northeast-1d"

  tags = {
    Name    = "private-ap-northeast-1d"
    Service = "Armageddon"
    Owner   = "Crows"
    Goal  = "Leave_Matrix"
  }
}
