#!/bin/bash

serverIP=""
BASEDIR=$(dirname $(realpath "$0"))

sudo apt update
sudo apt install strongswan strongswan-pki

mkdir -p ~/pki/{cacerts,certs,private}
chmod 700 ~/pki

ipsec pki --gen --type rsa --size 4096 --outform pem > ~/pki/private/ca-key.pem

ipsec pki --self --ca --lifetime 3650 --in ~/pki/private/ca-key.pem \
    --type rsa --dn "CN=VPN root CA" --outform pem > ~/pki/cacerts/ca-cert.pem


ipsec pki --gen --type rsa --size 4096 --outform pem > ~/pki/private/server-key.pem

ipsec pki --pub --in ~/pki/private/server-key.pem --type rsa \
    | ipsec pki --issue --lifetime 1825 \
        --cacert ~/pki/cacerts/ca-cert.pem \
        --cakey ~/pki/private/ca-key.pem \
        --dn "CN=$serverIP" --san $serverIP \
        --flag serverAuth --flag ikeIntermediate --outform pem \
    >  ~/pki/certs/server-cert.pem



sudo cp -r ~/pki/* /etc/ipsec.d/
sudo mv /etc/ipsec.conf{,.original}

sudo mv $BASEDIR/ipsec.conf /etc/ipsec.conf
sed -i "s/@server_domain_or_IP/${serverIP}/" /etc/ipsec.conf

sudo mv $BASEDIR/ipsec.secrets /etc/ipsec.secrets

sudo systemctl restart strongswan

sudo ufw allow OpenSSH
sudo ufw enable

sudo ufw allow 500,4500/udp

ip route | grep default