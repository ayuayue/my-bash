#!/usr/bin/env sh
# 参数1为域名,2是路径 使用 webroot方式申请,单域名 certbot
echo "请在 nginx 域名配置文件中加入一下内容";
echo  "===="
cat  <<EOF
location ^~ /.well-known/acme-challenge/ {
    default_type "text/plain";
    root     /www;
}

location = /.well-known/acme-challenge/ {
    return 404;
}
EOF
echo "===="

DOMAIN=$1
DIR=$2
echo "域名: $DOMAIN";
echo "路径: $DIR";
certbot certonly --agree-tos -d $DOMAIN \
--webroot -w $DIR \
--dry-run

echo "请执行: certbot certonly --webroot -w $DIR -d $DOMAIN 生成证书"