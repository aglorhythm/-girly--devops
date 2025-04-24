#!/usr/bin/env bash

####
# This script saves the following data :
# - the wordpress database - weekly
####

echo "hello"
# backup paths
backup_path="/home/ubuntu/backup"
database_backup="$backup_path"/database


# create database backup folder for mariadb
create_database_backup_folder(){
    if [ ! -d "$database_backup" ]; then
        mkdir "$database_backup"
        echo "Created Wordpress backup folder: $database_backup"
    else
        echo "Wordpress folder is here : $database_backup" 
        ls -larth $database_backup
    fi
}

# create the backup folder and save all data
create_backup(){

    # create a backup folder if it doesn't exist, else save new data to folder
    if [ ! -d "$backup_path" ]; then
        mkdir "$backup_path"
        echo "Created folder: $backup_path"
    else
        echo "Backup folder is already here :" 
        ls -larth $backup_path

        create_database_backup_folder
        mysqldump -u second_user -p mywordpress > "${database_backup}/database_mywordpress.sql" # -> credentials have to be save either as environment variable or in a config file to avoid prompt input
    fi
}

# run scripts
create_backup


