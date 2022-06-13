#!/bin/bash

# Update Ubuntu
apt-get -y update

# Install Nginx web server
apt-get -y install nginx

# Start Nginx service
service nginx start

# Get instanace hostname
EC2_HOSTNAME=$(curl -s http://169.254.169.254/latest/meta-data/hostname)

# Saving string into a file (index.html)
echo "<h1>Hello World from "$EC2_HOSTNAME"</h1>" > /var/www/html/index.html

# Restarting Nginx
service nginx restart
