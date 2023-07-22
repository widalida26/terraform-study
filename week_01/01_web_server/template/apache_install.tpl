#!/bin/bash
apt-get upgrade -y
apt-get install apache2 -y
systemctl start apache2
systemctl enable apache2
echo "AddDefaultCharset UTF-8" >> /etc/apache2/conf-enabled/charset.conf
echo "${nickname}" > /var/www/html/index.html
systemctl restart apahce2