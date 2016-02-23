#!/bin/bash
echo "Type the domain name followed by [ENTER]:"
read domain
apt-get -y update
debconf-set-selections <<< "postfix postfix/mailname string archangelsystems.co.uk"
debconf-set-selections <<< "postfix postfix/main_mailer_type string 'Internet Site'"
apt-get install -y postfix
sed -i '31s/.*/myhostname = archangelsystems.co.uk/' /etc/postfix/main.cf
service postfix restart

