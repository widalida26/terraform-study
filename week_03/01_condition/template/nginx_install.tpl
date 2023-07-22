#!/bin/bash
apt-get upgrade -y
apt install nginx -y
systemctl start nginx
systemctl enable nginx
echo "${msg}" > /var/www/html/index.html
systemctl restart nginx