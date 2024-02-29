#!/bin/bash

# Install SSM Agent
sudo yum install -y https://s3.amazonaws.com/ec2-downloads-windows/SSMAgent/latest/linux_amd64/amazon-ssm-agent.rpm
sudo systemctl start amazon-ssm-agent

# Enable EPEL extra repository
sudo amazon-linux-extras enable epel

# Install EPAL repository
sudo yum install epel-release -y

# Install Nginx web server
sudo yum install nginx -y

# Start Nginx service
sudo systemctl start nginx

# Install JQ
sudo yum install jq -y

# Set nginx to start on boot
sudo chkconfig nginx on

# Get EC2 instance hostname
EC2_HOSTNAME=$(curl -s http://169.254.169.254/latest/meta-data/hostname)

# Get EC2 instance AWS region
EC2_REGION=$(curl -s http://169.254.169.254/latest/dynamic/instance-identity/document | jq -r .region)

# Change file permission
sudo chmod 777 /usr/share/doc/HTML/index.html

# REDIRECT STRING TO A INDEX.HTML FILE
echo "<h1>Hello World from "$EC2_HOSTNAME" in the AWS Region "$EC2_REGION"</h1>" > /usr/share/doc/HTML/index.html

# Restart nginx service
sudo systemctl restart nginx

# Downloading rc.local file to /etc/rc.d/
sudo aws s3 cp s3://rds-demo-for-cloudacia-a/rc.local /etc/rc.d/rc.local

# Applying execution permission to /etc/rc.d/rc.local
sudo chmod +x /etc/rc.d/rc.local


 

