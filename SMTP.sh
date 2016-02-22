#!/bin/bash
echo "Type the domain name followed by [ENTER]:"

read domain

apt-get -y update
debconf-set-selections <<< "postfix postfix/mailname string your.hostname.com"
debconf-set-selections <<< "postfix postfix/main_mailer_type string 'Internet Site'"
apt-get install -y postfix
sed -i '31s/.*/myhostname = $domain/' /etc/postfix/main.cf
postmap /etc/postfix/virtual
service postfix restart



