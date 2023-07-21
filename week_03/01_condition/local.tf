locals {
  az_count = length(var.availability_zones)
  az_names = formatlist("${var.region}%s", var.availability_zones)

  web_server_user_data = var.is_apache ? templatefile("./template/apache_install.tpl", {
    msg = "apache server"
    }) : templatefile("./template/nginx_install.tpl", {
    msg = "nginx server"
  })
}