#!/usr/bin/env bash

DATE==$(date +'%Y_%m_%d_%H_%m_%s')

cp /etc/php/7.2/cli/php.ini /etc/php/7.2/cli/php.ini.$DATE.bkp
cp /etc/php/7.2/fpm/php.ini /etc/php/7.2/fpm/php.ini.$DATE.bkp


sudo apt update
sudo apt install nginx
sudo ufw app list
sudo ufw allow 'Nginx HTTPS'
sudo ufw status


rm /etc/nginx/sites-enabled/*
sudo apt-get update
sudo apt-get install software-properties-common
sudo add-apt-repository universe
sudo add-apt-repository ppa:certbot/certbot
sudo apt-get update
sudo apt-get install certbot python-certbot-nginx


sudo wget https://raw.githubusercontent.com/mitchellkrogza/nginx-ultimate-bad-bot-blocker/master/install-ngxblocker -O /usr/local/sbin/install-ngxblocker
sudo chmod +x /usr/local/sbin/install-ngxblocker
cd /usr/local/sbin/
sudo ./install-ngxblocker -x

cd /usr/local/sbin/
sudo ./setup-ngxblocker -x



apt-get update && apt-get install -y zlib1g-dev bzip2

#WE HAVE TO ADD MANUALL THIS INSIDE /ETC/NGINX/NGINX.CONF
#client_max_body_size 100M;

#I HAVE TO COMMENT THIS LINE INSIDE vim /etc/nginx/conf.d/botblocker-nginx-settings.conf
#server_names_hash_bucket_size 128;



service php7.2-fpm restart
service nginx restart
