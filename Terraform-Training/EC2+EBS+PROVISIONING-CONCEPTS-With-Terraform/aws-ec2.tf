

resource "aws_instance" "myweb" {
  ami           = ""
  instance_type = "t2.micro"
  key_name      = ""
  security_groups = [""]

  tags = {
    Name = ""
  }
}
