#!/bin/bash
sudo yum -y update
sudo yum -y install gcc pcre-devel openssl openssl-devel wget unzip tar git
sudo useradd --shell /sbin/nologin nginx
wget http://nginx.org/download/nginx-1.10.2.tar.gz
tar -zxvf nginx-1.10.2.tar.gz
wget https://github.com/arut/nginx-rtmp-module/archive/master.zip
unzip master
cd nginx-1.10.2
./configure --user=www-data --group=www-data --with-http_ssl_module --with-http_realip_module --add-module=../nginx-rtmp-module-master
make
sudo make install
sudo cp /vagrant/nginx.conf /usr/local/nginx/conf/nginx.conf
# sudo ln -s /usr/local/nginx/sbin/nginx /usr/bin/nginx
# sudo yum -y make libaio libaio-devel libssl-devel pcre-devel ffmpeg
# sudo yum -y install yum-plugin-priorities epel-release
# sudo rpm -Uvh http://li.nux.ro/download/nux/dextop/el7/x86_64/nux-dextop-release-0-5.el7.nux.noarch.rpm
# sudo yum -y --enablerepo=epel,nux-dextop install ffmpeg
sudo /usr/local/nginx/sbin/nginx
# sudo nginx
ip a | grep eth1