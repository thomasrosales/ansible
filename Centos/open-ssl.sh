#!/bin/bash

echo "Installing OpenSSL"

curl https://ftp.openssl.org/source/old/1.1.1/openssl-1.1.1.tar.gz | tar -xzv
yum -y update
yum -y install make gcc perl pcre-devel zlib-devel
cd openssl-1.1.1
./config --prefix=/usr --openssldir=/etc/ssl \
    --libdir=lib no-shared zlib-dynamic
make
make install
export LD_LIBRARY_PATH=/usr/local/lib:/usr/local/lib64
echo "export LD_LIBRARY_PATH=/usr/local/lib:/usr/local/lib64" >> ~/.bashrc
cd ..
rm -R -f openssl-1.1.1