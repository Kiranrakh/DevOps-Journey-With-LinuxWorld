# EC2 INSTANCE IN PRIVATE SUBNET
resource "aws_security_group" "private_ec2_sg" {
  name        = "private-ec2-sg"
  description = "Allow SSH from specific IP"
  vpc_id      = aws_vpc.main.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["203.0.113.10/32"] # Replace with your IP
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "private-ec2-sg"
  }
}

resource "aws_instance" "private_ec2" {
  ami                         = "ami-0a0f1259dd1c90938"
  instance_type               = "t2.micro"
  subnet_id                   = aws_subnet.private_subnet_1a.id
  vpc_security_group_ids      = [aws_security_group.private_ec2_sg.id]
  associate_public_ip_address = false
  key_name                    = "your-key-pair"

  tags = {
    Name = "private-ec2"
  }
}