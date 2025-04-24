#!/usr/bin/env bash

####
# This script saves the following data :
# - the wordpress website and config - monthly
# - php config files - monthly
# - nginx config files - monthly
####

echo "hello"
# backup paths
backup_path="/home/ubuntu/backup"
wordpress_backup="$backup_path"/wordpress
php_backup="$backup_path"/php
nginx_backup="$backup_path"/nginx

# paths of data to save
wordpress_website_folder_path="/var/www/html/wordpress"
php_config_file_path="/etc/php/8.0/fpm/php.ini"
nginx_config_files_path=$(find /etc/nginx -name '*.conf')



# create wordpress backup folder for website files
create_wordpress_backup_folder(){
    if [ ! -d "$wordpress_backup" ]; then
        mkdir "$wordpress_backup"
        echo "Created Wordpress backup folder: $wordpress_backup"
    else
        echo "Wordpress folder is here : $wordpress_backup" 
        ls -larth $wordpress_backup
    fi
}

# create php backup  folder for config files
create_php_backup_folder(){
    if [ ! -d "$php_backup" ]; then
        mkdir "$php_backup"
        echo "Created Php backup folder: $php_backup"
    else
        echo "Php folder is here : $php_backup" 
        ls -larth $php_backup
    fi
}

# create ngninx backup  folder for config files
create_nginx_backup_folder(){
    if [ ! -d "$nginx_backup" ]; then
        mkdir "$nginx_backup"
        echo "Created Nginx backup folder: $nginx_backup"
    else
        echo "Nginx folder is here : $nginx_backup" 
        ls -larth $nginx_backup
    fi
}

# Create the backup folder and save all data
create_backup(){

    # create a backup folder if it doesn't exist, else save new data ro folder
    if [ ! -d "$backup_path" ]; then
        mkdir "$backup_path"
        echo "Created folder: $backup_path"
    else
        echo "Backup folder is already here :" 
        ls -larth $backup_path

        create_wordpress_backup_folder
        create_php_backup_folder
        create_nginx_backup_folder
        rsync -r "$wordpress_website_folder_path" "$wordpress_backup"
        rsync -r "$php_config_file_path" "$php_backup"

        # Save each files that contains 'conf' in their names
        find /etc/nginx -name '*.conf' -exec rsync -r {} "$nginx_backup" \;
    fi
}

# run scripts
create_backup
