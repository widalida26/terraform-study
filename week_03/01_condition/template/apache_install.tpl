#!/bin/bash
sudo apt-get upgrade -y
sudo apt-get install apache2 -y
sudo systemctl start apache2
sudo systemctl enable apache2
sudo echo "${msg}" > /var/www/html/index.html
sudo systemctl restart apahce2