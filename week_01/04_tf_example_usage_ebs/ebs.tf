resource "aws_volume_attachment" "ebs_att_apache_web_server" {
  device_name = "/dev/sdh"
  volume_id   = aws_ebs_volume.apache_web_server_volume.id
  instance_id = aws_instance.apache_web_server.id
}

resource "aws_ebs_volume" "apache_web_server_volume" {
  availability_zone = aws_instance.apache_web_server.availability_zone
  size              = 1

tags = {
    Name = "${var.prefix}-ebs"
  }
}