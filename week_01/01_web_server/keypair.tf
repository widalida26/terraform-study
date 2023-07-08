data "local_file" "public_key" {
  filename = "./keypair/apache-web-key.pub"
}

resource "aws_key_pair" "apache_web_key_pair" {
  key_name   = "apache-web-key"
  public_key = data.local_file.public_key.content
}