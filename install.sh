#!bin/bash
echo "installing Go Lang"
wget https://golang.org/dl/go1.15.2.linux-amd64.tar.gz ;
tar -C /usr/local -xzf go1.15.2.linux-amd64.tar.gz ;
export PATH=$PATH:/usr/local/go/bin ;
source ~/.profile ;
go version ;
