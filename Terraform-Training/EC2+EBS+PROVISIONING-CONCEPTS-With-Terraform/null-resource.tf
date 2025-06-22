# Commands to be run inside EC2 (done via remote-exec)
# sudo fdisk -l
# sudo mkfs.xfs /dev/<device-name>
# sudo yum install httpd -y
# cd /var/www/html/
# sudo mount <device-name> /var/www/html
# echo "Welcome to LW" > /var/www/html/index.html
# sudo systemctl restart httpd

resource "null_resource" "null-resource-sss-h" {

  provisioner "remote-exec" {
    inline = [
      "sudo fdisk -l",
      "sudo mkfs.xfs /dev/<device-name>",
      "sudo yum install httpd -y",
      "cd /var/www/html",
      "sudo mount <device-name> /var/www/html",
      "sudo sh -c 'echo Welcome to LW > /var/www/html/index.html'",
      "sudo systemctl restart httpd"
    ]
  }

  connection {
    type        = "ssh"
    user        = "ec2-user"
    private_key = file("c:/Path/to/your/key.pem")
    host        = aws_instance.myweb.public_ip
  }
}

resource "null_resource" "null-resource-local-chrome" {

  provisioner "local-exec" {
    command = "chrome http://${aws_instance.myweb.public_ip}/"
  }
}

