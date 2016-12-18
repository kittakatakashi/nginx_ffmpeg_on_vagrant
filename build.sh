#!/bin/bash
sudo yum -y update
if [ ! -e '/usr/local/nginx/conf/nginx.conf' ]; then
    sudo yum -y install gcc pcre-devel openssl openssl-devel wget unzip tar git make
    sudo useradd --shell /sbin/nologin nginx
    wget http://nginx.org/download/nginx-1.10.2.tar.gz
    tar -zxvf nginx-1.10.2.tar.gz
    wget https://github.com/arut/nginx-rtmp-module/archive/master.zip
    unzip master
    cd nginx-1.10.2
    ./configure --user=www-data --group=www-data --with-http_ssl_module --with-http_realip_module --add-module=../nginx-rtmp-module-master
    make
    sudo make install
    cd ../

    # sudo yum -y install libaio libaio-devel libssl-devel pcre-devel
    # sudo yum -y install autoconf automake gcc-c++ pkgconfig libtool zlib-devel
    # sudo yum -y install http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm
    # sudo yum -y install --enablerepo=epel yasm

    # sudo git clone git://git.videolan.org/x264
    # cd x264
    # sudo ./configure --enable-shared
    # sudo make
    # sudo make install
    # cd ../

    # sudo git clone --depth 1 git://github.com/mstorsjo/fdk-aac.git
    # cd fdk-aac
    # sudo autoreconf -fiv
    # sudo ./configure
    # sudo make
    # sudo make install
    # cd ../

    # export LD_LIBRARY_PATH=/usr/local/lib/
    # sudo echo /usr/local/lib > /etc/ld.so.conf.d/custom-libs.conf
    # sudo ldconfig

    # sudo git clone git://source.ffmpeg.org/ffmpeg.git ffmpeg
    # cd ffmpeg
    # sudo ./configure --enable-gpl --enable-nonfree --enable-libfdk_aac --enable-libx264 --enable-shared --arch=x86_64 --enable-pthreads
    # sudo make
    # sudo make install
    # ffmpeg -version
fi
sudo cp /vagrant/nginx.conf /usr/local/nginx/conf/nginx.conf
sudo /usr/local/nginx/sbin/nginx
ffmpeg -re -stream_loop -1 -i '/vagrant/BigBuckBunny.mp4' -acodec libfdk_aac -vcodec libx264 -f flv "rtmp://192.168.0.100:1935/live/mdst"
# sudo nginx
