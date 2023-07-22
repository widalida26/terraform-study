resource "aws_instance" "web_server" {

  ami                    = data.aws_ami.latest_ubuntu_22_04.id
  instance_type          = var.instance_type
  vpc_security_group_ids = [aws_security_group.web_sg.id]
  key_name               = var.key_name

  user_data =  templatefile("./template/apache_install.tpl", {
    msg = "apache"
  })

  tags = {
    Name = "${var.prefix}-server"
  }
}

resource "aws_eip" "web_server_eip" {
  instance = aws_instance.web_server.id
}

resource "terraform_data" "on_id_change" {
  triggers_replace = [
    aws_instance.web_server.id
  ] 
  
  input = aws_instance.web_server.id
}

output "terraform_data_output" {
  value = terraform_data.on_id_change.output 
}