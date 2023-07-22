#!/bin/bash
apt-get upgrade -y
apt-get install apache2 -y
systemctl start apache2
systemctl enable apache2
echo "${msg}" > /var/www/html/index.html
systemctl restart apahce2