# SUBNETS (PUBLIC + PRIVATE)
resource "aws_subnet" "public_subnet_1c" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "ap-south-1c"
  map_public_ip_on_launch = true

  tags = {
    Name = "public-subnet-1c"
  }
}

resource "aws_subnet" "private_subnet_1a" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = "ap-south-1a"

  tags = {
    Name = "private-subnet-1a"
  }
}

resource "aws_subnet" "private_subnet_2b" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.3.0/24"
  availability_zone = "ap-south-1b"

  tags = {
    Name = "private-subnet-2b"
  }
}

resource "aws_subnet" "private_subnet_3c" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.4.0/24"
  availability_zone = "ap-south-1c"

  tags = {
    Name = "private-subnet-3c"
  }
}