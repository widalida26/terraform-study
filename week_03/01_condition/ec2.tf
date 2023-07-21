resource "aws_instance" "web_server" {
  ami                    = data.aws_ami.latest_ubuntu_22_04.id
  instance_type          = var.instance_type
  vpc_security_group_ids = [aws_security_group.web_sg.id]
  key_name               = var.key_name

  user_data = local.web_server_user_data

  tags = {
    Name = "${var.prefix}-server"
  }
}