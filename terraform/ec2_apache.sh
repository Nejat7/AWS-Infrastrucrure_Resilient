#! /bin/bash

# get admin privileges
sudo su

# install httpd
yum update -y
yum install -y httpd.x86_64
systemctl start httpd.service
systemctl enable httpd.service
echo "Hello World from $(ec2-metadata -i)" > /var/www/html/index.html