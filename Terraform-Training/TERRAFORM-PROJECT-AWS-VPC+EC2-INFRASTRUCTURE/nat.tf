# NAT GATEWAY & PRIVATE ROUTING
# resource "aws_eip" "nat_eip" {
#   vpc = true
# }

resource "aws_nat_gateway" "nat" {
  #allocation_id = aws_eip.nat_eip.id
  subnet_id     = aws_subnet.public_subnet_1c.id

  depends_on = [aws_internet_gateway.igw]

  tags = {
    Name = "main-nat"
  }
}

resource "aws_route_table" "private_rt" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat.id
  }

  tags = {
    Name = "private-route-table"
  }
}

resource "aws_route_table_association" "private_rt_assoc_1" {
  subnet_id      = aws_subnet.private_subnet_1a.id
  route_table_id = aws_route_table.private_rt.id
}

resource "aws_route_table_association" "private_rt_assoc_2" {
  subnet_id      = aws_subnet.private_subnet_2b.id
  route_table_id = aws_route_table.private_rt.id
}

resource "aws_route_table_association" "private_rt_assoc_3" {
  subnet_id      = aws_subnet.private_subnet_3c.id
  route_table_id = aws_route_table.private_rt.id
}