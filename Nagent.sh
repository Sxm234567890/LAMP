#!/bin/bash
yum -y insatll gcc pcre-devel openssl-devel
wget https://nginx.org/download/nginx-1.24.0.tar.gz
tar -xf  nginx-1.24.0.tar.gz 
cd  nginx-1.24.0
./configure --prefix=/usr/local/nginx --with-http_ssl_module 
make 
make install
ln -s /usr/local/nginx/sbin/nginx  /sbin/
nginx
sed -i '55i\    location / {\n        proxy_pass http://webs;\n    }' nginx.conf   #在文件中插入文件中server中
sed -i '45i\upstream webs {\n    server 192.168.75.134:80;\n    server 192.168.75.135:80;\n}' filename 
nginx -s reload
yum -y install memcache 
systemctl start memcache

#sed -i '45i\location /{\n  proxy_pass http://webs:\n }  }'  nginx.conf
