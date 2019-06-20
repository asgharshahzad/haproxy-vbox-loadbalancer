#!/bin/bash
sed -i --follow-symlinks 's/^SELINUX=.*/SELINUX=disabled/g' /etc/sysconfig/selinux && cat /etc/sysconfig/selinux
sed -i --follow-symlinks 's/^SELINUX=.*/SELINUX=disabled/g' /etc/selinux/config && cat /etc/selinux/config
yum -y install httpd
echo "Hello World! from web server 2" > /var/www/html/index.html
sudo systemctl start httpd.service
sudo systemctl enable httpd.service