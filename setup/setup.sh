#!/bin/bash

echo "DETECTING OS VERSION..."

OS=$(lsb_release -i -s)

if [ "$OS" -eq "Ubuntu" ];
then
    PKGMAN="apt-get"
fi

if [ "$OS" -eq "CentOS" ] || [ "$OS" -eq "Fedora" ];
then
    PKGMAN="yum"
fi

echo "CHECKING IF REDIS IS INSTALLED..."

if [ type redis-server 2>/dev/null ];
then
    echo "REDIS-SERVER: INSTALLED"
else
    cd ~
    if [ type wget 2>/dev/null ];
        echo "WGET: INSTALLED"
    then
        echo "WGET: NOT INSTALLED"
        echo "INSTALLINNG..."
        sudo $PKGMAN install -y wget
    fi
    wget http://download.redis.io/redis-stable.tar.gz
    tar xvzf redis-stable.tar.gz
    cd redis-stable
    sudo make install
    sudo make test
    sudo sed -i "s/daemonize .*/daemonize yes/" redis.conf
    echo -n | sudo utils/install_server.sh
fi

echo "INSTALLING PREDIS..."
cd /usr/share/nginx/html
sudo composer require predis/predis