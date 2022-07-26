#!/usr/bin/env bash
# 常用开发工具安装

yum groups mark convert

yum grouplist 

yum groupinstall "System Management" "Development Tools" -y

yum install -y net-tools libxml2 libxml2-dev sqlite sqlite-devel gcc g++ psmisc vim tcpdump perf top autoconf valgrind expat-devel  glibc-headers gcc-c++ screenfetch tmux screen lrzsz pcre pcre-devel zlib zlib-devel ruby openssl openssl-devel patch wget bash-completion lsof unzip zip gdb make tree nmap dos2unix nc htop iftop iotop sysstat nethogs vim-enhanced epel-release libpng libpng-devel freetype freetype-devel zlib zlib-devel libzip libzip-devel bzip2 bzip2-devel oniguruma oniguruma-devel telnet iperf3 httpd-tools lrzsz


echo "install finished"