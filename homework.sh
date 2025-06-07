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
	sudo yum update
  	sudo apt install -y apache2 php libapache2-mod-php php-mysql wget unzip
 	wget -c https://wordpress.org/latest.zip
  	unzip latest.zip
	sudo rm -rf /var/www/html/*
  	sudo mv wordpress/* /var/www/html/
	sudo chown -R www-data:www-data /var/www/html
}

wordpress

function binary() {
	sudo apt update
  	sudo apt install -y tree
	sudo apt install -y gnupg software-properties-common curl
	curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
	sudo tee /etc/apt/sources.list.d/hashicorp.list
	sudo apt update
	sudo apt install -y terraform
}

binary
