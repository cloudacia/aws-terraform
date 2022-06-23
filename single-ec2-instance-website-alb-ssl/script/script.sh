#!/bin/bash

# UPDATE UBUNTU OS
apt-get -y update

# INSTALL NGINX WEB SERVER
apt-get -y install nginx

# START NGINX WEB SERVER
service nginx start

# STORE THE INSTANCE HOSTNAME INSIDE A SHELL ENV VARIABLE
EC2_HOSTNAME=$(curl -s http://169.254.169.254/latest/meta-data/hostname)

# REDIRECT STRING TO A INDEX.HTML FILE
echo "<h1>Hello World from "$EC2_HOSTNAME"</h1>" > /var/www/html/index.html

# RESTART NGINX WEB SERVER
service nginx restart
