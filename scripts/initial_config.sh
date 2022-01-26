#!/bin/bash
sudo yum -y update
sudo yum -y install httpd
sudo service httpd start
sudo bash -c 'echo "Production Server" > /var/www/html/index.html'
sudo chkconfig httpd on
sudo systemctl enable httpd
