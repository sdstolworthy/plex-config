#!/bin/bash

if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 
   exit 1
fi

echo Where should I look for media?
read media_location

echo Where should I store configuration options?
read config_location

apt install -y docker.io docker-compose

ln -s $config_location ./config
ln -s $media_location ./media


docker-compose up -d

