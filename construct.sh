#!/bin/bash
sudo yum -y update
sudo yum -y install gcc pcre-devel openssl openssl-devel wget unzip tar
sudo useradd --shell /sbin/nologin nginx
wget http://nginx.org/download/nginx-1.10.2.tar.gz
tar -zxvf nginx-1.10.2.tar.gz
wget https://github.com/arut/nginx-rtmp-module/archive/master.zip
unzip master
cd nginx-1.10.2
./configure --user=www-data --group=www-data --with-http_ssl_module --with-http_realip_module --add-module=../nginx-rtmp-module-master
make
sudo make install
sudo cp nginx.conf /usr/local/nginx/conf/nginx.conf
sudo /usr/local/nginx/sbin/nginx
