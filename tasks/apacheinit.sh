#!/bin/bash

if [[ $PT_action = "install" ]]
then
    sudo yum update httpd
    sudo yum install httpd -y
    sudo yum update firewalld
    sudo yum install firewalld -y
    sudo firewall-cmd --permanent --add-service=http
    sudo firewall-cmd --reload
    sudo systemctl start httpd
    echo "Apache Webserver is up and running!"
elif [[ $PT_action = "uninstall" ]]
then
    sudo systemctl stop httpd
    sudo yum remove firewalld -y
    sudo yum remove httpd -y
    echo "Apache Webserver has been taken down and removed!"
fi
