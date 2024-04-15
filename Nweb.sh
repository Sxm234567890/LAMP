#!/bin/bash
yum -y install gcc pcre-devel openssl-deve
systemctl stop firewalld
yum -y install mariadb mariadb-server mariadb-devel
yum -y install php-fpm php-mysql
systemctl php-fpm mariadb
wget https://nginx.org/download/nginx-1.24.0.tar.gz
tar -xf  nginx-1.24.0.tar.gz 
cd  nginx-1.24.0
./configure --prefix=/usr/local/nginx --with-http_ssl_module 
make 
make install
ln -s /usr/local/nginx/sbin/nginx  /sbin/
nginx
sed -i '84i\location ~ \.php$ { \n    root  html;\n fastcgi_pass   127.0.0.1:9000;\n fastcgi_index  index.php;\n include     fastcgi.conf; }' /usr/local/nginx/conf/nginx.conf
mv login.php logout.php protected_page.php  /usr/local/nginx/html
yum -y install php-pecl-memcache
sed -i 's/php_value\[session.save_handler\] = files/php_value\[session.save_handler\] = memcache/g; s/php_value\[session.save_path\] = \/var\/lib\/php\/session/php_value\[session.save_path\] = "tcp:\/\/192.168.75.133:11211"/g' your_file.conf
systemctl restart php-fpm
nginx -s reload



#sed -i 's/php_value\[session.save_handler\]=files/ php_value\[session.save_handler\] = memcache/g'

#sed -i '45i\location /{\n  proxy_pass http://webs:\n }  }'  nginx.conf
