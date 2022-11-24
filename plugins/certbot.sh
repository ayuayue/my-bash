#!/usr/bin/env sh
# 参数1为域名,2是 root 路径 使用 webroot方式申请,单域名 certbot
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
# 根据命令手动添加 txt 记录到域名解析,无须配置nginx， --webroot 需要配置
certbot certonly --agree-tos -d $DOMAIN \
--preferred-challenges dns \
--manual --server https://acme-v02.api.letsencrypt.org/directory \
# --webroot -w $DIR \
--dry-run

echo "请执行: certbot certonly --webroot -w $DIR -d $DOMAIN 生成证书"