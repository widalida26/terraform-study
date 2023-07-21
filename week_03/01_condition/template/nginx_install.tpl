#!/bin/bash
sudo apt-get upgrade -y
sudo apt install nginx -y
sudo systemctl start nginx
sudo systemctl enable nginx
sudo echo "${msg}" > /var/www/html/index.html
sudo systemctl restart nginx