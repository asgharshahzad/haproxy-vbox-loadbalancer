#!/bin/bash
yum -y install haproxy
cat > /etc/haproxy/haproxy.cfg <<EOF
global
    log /dev/log local0
    log localhost local1 notice
    user haproxy
    group haproxy
    maxconn 2000
    daemon
 
defaults
    log global
    mode http
    option httplog
    option dontlognull
    timeout connect 200ms
    timeout client 1000ms
    timeout server 1000ms
 
frontend http-in
    bind *:80
    default_backend webservers
 
backend webservers
    balance roundrobin
    stats enable
    stats auth admin:admin
    stats uri /haproxy?stats
    option httpchk
    option forwardfor
    option http-server-close
    server web1 192.168.0.101:80 check
    server web2 192.168.0.102:80 check
EOF
sudo systemctl start haproxy.service
sudo systemctl enable haproxy.service