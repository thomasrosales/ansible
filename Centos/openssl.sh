#!/bin/bash
echo "Installing OpenSSL..."
OPENSSL_PATH=/usr/local/src/openssl-1.1.1
if [ -d "$OPENSSL_PATH" ]; then
    cd "$OPENSSL_PATH"
    ./config --prefix=/usr --openssldir=/etc/ssl --libdir=lib no-shared zlib-dynamic
    make
    make install
    export LD_LIBRARY_PATH=/usr/local/lib:/usr/local/lib64
    echo "export LD_LIBRARY_PATH=/usr/local/lib:/usr/local/lib64" >> ~/.bashrc
    cd ..
    rm -R -f "$OPENSSL_PATH"
    echo "Installing OpenSSL...OK"
else
    echo "Erro: instaling OpenSSL"
fi
