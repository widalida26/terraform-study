# ec2 - apache web server
resource "aws_instance" "apache_web_server" {
  ami                    = data.aws_ami.latest_ubuntu_22_04.id
  instance_type          = var.instance_type
  vpc_security_group_ids = [aws_security_group.web_sg.id]
  key_name               = aws_key_pair.apache_web_key_pair.key_name
  user_data = templatefile("./template/apache_install.tpl", {
    nickname = var.nickname
  })
  tags = {
    Name = "${var.prefix}-server"
  }
}