#!/usr/bin/env bash

DATE==$(date +'%Y_%m_%d_%H_%m_%s')

cp /etc/php/7.2/cli/php.ini /etc/php/7.2/cli/php.ini.$DATE.bkp
cp /etc/php/7.2/fpm/php.ini /etc/php/7.2/fpm/php.ini.$DATE.bkp

sed -i 's,^upload_max_filesize =.*$,upload_max_filesize = 250M,' /etc/php/7.2/cli/php.ini
sed -i 's,^upload_max_filesize =.*$,upload_max_filesize = 250M,' /etc/php/7.2/fpm/php.ini

sed -i 's,^post_max_size =.*$,post_max_size = 50M,' /etc/php/7.2/cli/php.ini
sed -i 's,^post_max_size =.*$,post_max_size = 50M,' /etc/php/7.2/fpm/php.ini

sed -i 's,^max_execution_time =.*$,max_execution_time = 100,' /etc/php/7.2/cli/php.ini
sed -i 's,^max_execution_time =.*$,max_execution_time = 100,' /etc/php/7.2/fpm/php.ini

sed -i 's,^max_input_time =.*$,max_input_time = 250,' /etc/php/7.2/cli/php.ini
sed -i 's,^max_input_time =.*$,max_input_time = 250,' /etc/php/7.2/fpm/php.ini

sed -i 's,^; max_input_vars =.*$,max_input_vars = 5000,' /etc/php/7.2/cli/php.ini
sed -i 's,^; max_input_vars =.*$,max_input_vars = 5000,' /etc/php/7.2/fpm/php.ini

service php7.2-fpm restart
service nginx restart
