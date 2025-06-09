#!/bin/bash

function k-pop() {
	sudo useradd jenny
	sudo useradd rose
	sudo useradd lisa
	sudo useradd jisoo

	sudo groupadd blackpink

	sudo usermod -aG blackpink jenny
	sudo usermod -aG blackpink rose
	sudo usermod -aG blackpink lisa
	sudo usermod -aG blackpink jisoo
}
k-pop

function wordpress() {
	sudo yum update -y
  	sudo yum install -y httpd php php-mysqlnd httpd wget unzip
	sudo systemctl start httpd
	sudo systemctl enable httpd

	wget https://wordpress.org/latest.zip
	unzip latest.zip

	sudo rm -rf /var/www/html/*
	sudo mv wordpress/* /var/www/html/
	sudo useradd apache

	sudo chown -R apache:apache /var/www/html
	sudo chmod -R 755 /var/www/html
	sudo systemctl restart httpd

}

wordpress

function binary() {

sudo yum install -y tree

sudo yum install -y yum-utils
sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/AmazonLinux/hashicorp.repo
sudo yum -y install terraform
}

binary
