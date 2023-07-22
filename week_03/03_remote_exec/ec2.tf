resource "aws_instance" "web_server" {
  ami                    = data.aws_ami.latest_ubuntu_22_04.id
  instance_type          = var.instance_type
  vpc_security_group_ids = [aws_security_group.web_sg.id]
  key_name               = var.key_name

  user_data = templatefile("./template/apache_install.tpl", {
    msg = "apache server"
  })

  tags = {
    Name = "${var.prefix}-server"
  }
}

resource "aws_eip" "web_server_eip" {
  instance = aws_instance.web_server.id
}

resource "null_resource" "code_deploy_agent_install" {
  provisioner "remote-exec" {
    connection {
      host = aws_eip.web_server_eip.public_ip
      type = "ssh"
      user = "ubuntu"
      private_key = file("./keypair/test-key.pem")
    }
    script = "./tmp/ssm_agent_install.sh"
      
  } 
}