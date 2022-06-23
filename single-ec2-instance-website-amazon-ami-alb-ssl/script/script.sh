#!/bin/bash

# Enable EPEL extra repository
sudo amazon-linux-extras enable epel

# Install EPAL repository
sudo yum install epel-release -y

# Install Nginx web server
sudo yum install nginx -y

# Start Nginx service
sudo systemctl start nginx

# Set nginx to start on boot
sudo chkconfig nginx on

# Get EC2 instance hostname
EC2_HOSTNAME=$(curl -s http://169.254.169.254/latest/meta-data/hostname)

# Change file permission
sudo chmod 777 /usr/share/doc/HTML/index.html

# REDIRECT STRING TO A INDEX.HTML FILE
echo "<h1>Hello World from "$EC2_HOSTNAME"</h1>" > /usr/share/doc/HTML/index.html

# Restart nginx service
sudo systemctl restart nginx
