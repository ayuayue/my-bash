#!/usr/bin/env sh
# Centos 系统初始化 
# 安装 zsh oh-my-zsh 及插件，默认启动 zsh
# 设置编码集
# 设置 docker 源
# 时间同步

yum install glibc-common -y
yum install -y langpacks-zh_CN
yum install git -y
echo 'export LC_ALL="zh_CN.UTF-8"' >> /etc/profile
source /etc/profile
echo 'LANG="zh_CN.UTF-8"' >> /etc/locale.conf
source /etc/locale.conf

sudo mkdir -p /etc/docker
sudo tee /etc/docker/daemon.json <<-'EOF'
{
  "registry-mirrors" : [
    "https://cxlpw11m.mirror.aliyuncs.com",
    "http://registry.docker-cn.com",
    "http://docker.mirrors.ustc.edu.cn",
    "http://hub-mirror.c.163.com"
  ],
  "insecure-registries" : [
    "registry.docker-cn.com",
    "docker.mirrors.ustc.edu.cn"
  ],
  "debug" : true,
  "experimental" : true
}
EOF
sudo systemctl daemon-reload
sudo systemctl restart docker

cd ~
wget https://jaist.dl.sourceforge.net/project/zsh/zsh/5.8/zsh-5.8.tar.xz
tar xvf zsh-5.8.tar.xz
cd zsh-5.8 && ./configure && make && make install
echo /usr/local/bin/zsh >> /etc/shells
chsh -s /usr/local/bin/zsh

sh -c "$(curl -fsSL https://gitee.com/Devkings/oh_my_zsh_install/raw/master/install.sh)"

git clone https://gitee.com/skarner/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions

git clone https://gitee.com/Annihilater/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting

rpm -ivh http://rpms.famillecollet.com/enterprise/remi-release-7.rpm
yum install epel-release -y
yum install yum-utils -y



yum -y install ntp
ntpdate pool.ntp.org
systemctl start ntpd


yum update