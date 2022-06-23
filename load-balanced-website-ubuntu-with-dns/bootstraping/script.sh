#!/bin/bash
# Update Ubuntu OS
sudo apt-get -y update

# Install Python
sudo apt-get -y install python-minimal

# Install Python CLI
sudo apt-get -y install awscli

# Install Unzip
sudo apt-get -y install unzip

# Copy a file from a S3 bucket to local directory
sudo aws s3 cp s3://s3-python-web-app-hello-world/http-server.py /home/ubuntu

# Run a Python Flask web server
sudo python /home/ubuntu/http-server.py &
