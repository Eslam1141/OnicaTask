#!/bin/bash

sudo apt update -y
sudo apt install apache2 -y
sudo touch /var/www/html/index.html
sudo echo "Hello world! You are connected to `hostname`" > /var/www/html/index.html
sudo service apache2 enable
sudo service apache2 start
