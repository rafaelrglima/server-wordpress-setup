#!/bin/bash

DATE==$(date +'%Y_%m_%d_%H_%m_%s')

if [ ! -e "config/websites.env" ]; then
  echo "The file config/websites.env file does not exist. You need to create the config file with the websites you want to control."
  exit
fi
if [ ! -e "/templates/nginx.conf" ]; then
  echo "The file templates/nginx.conf file does not exist"
  exit
fi
service nginx stop

mkdir backups/nginx/$DATE
while read -r WEBSITE; do
    cp /etc/nginx/sites-enabled/$WEBSITE backups/nginx/$DATE
    echo Configuring website $WEBSITE ....
    rm /etc/nginx/sites-enabled/$WEBSITE
    rm /etc/nginx/sites-available/$WEBSITE
    cp templates/nginx.conf /etc/nginx/sites-available/$WEBSITE
    sed -i "s/templatewebsiteaddress/$WEBSITE/g" "/etc/nginx/sites-available/$WEBSITE"
    ln -s /etc/nginx/sites-available/$WEBSITE /etc/nginx/sites-enabled/
done < config/websites.env

service nginx start
