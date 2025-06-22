# Optional output
# output "AZ" {
#   value = aws_instance.myweb.availability_zone
# }

resource "aws_ebs_volume" "ebs1" {
  size              = 2
  availability_zone = aws_instance.myweb.availability_zone
  tags = {
    Name = ""
  }
}
