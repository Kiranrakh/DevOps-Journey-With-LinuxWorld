


resource "aws_volume_attachment" "ebs1_attac" {
  device_name = "/dev/sbd"
  volume_id   = aws_ebs_volume.ebs1.id
  instance_id = aws_instance.myweb.id
}
