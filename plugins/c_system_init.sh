#!/usr/bin/env sh
# Centos 系统初始化 

yum install glibc-common langpacks-zh_CN git wget gcc make automake lrzsz -y

yum install curses curses-devel ncurses ncurses-devel  -y
rpm -ivh http://rpms.famillecollet.com/enterprise/remi-release-7.rpm
yum install epel-release -y
yum install yum-utils -y

# 设置 docker 源
mkdir -p /etc/docker
tee /etc/docker/daemon.json <<-'EOF'
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


# 时间同步
yum -y install ntp
ntpdate pool.ntp.org
systemctl start ntpd



# 安装 zsh oh-my-zsh 及插件，默认启动 zsh
cd ~
wget https://jaist.dl.sourceforge.net/project/zsh/zsh/5.8/zsh-5.8.tar.xz --no-check-certificate
tar xvf zsh-5.8.tar.xz
cd zsh-5.8 && ./configure && make && make install
echo /usr/local/bin/zsh >> /etc/shells
chsh -s /usr/local/bin/zsh
cd ~

sh -c "$(curl -fsSL https://gitee.com/caoayu/my-bash/raw/master/plugins/oh-my-zsh_install.sh)"

export ZSH_CUSTOM="~/.oh-my-zsh/custom"

git clone https://gitee.com/skarner/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions

git clone https://gitee.com/Annihilater/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting

echo "omz plugin enable docker docker-compose yum systemd rust python npm supervisor yarn pip pm2 node man aliases command-not-found history firewalld golang composer cp zsh-autosuggestions zsh-syntax-highlighting" >> ~/.zshrc

exec zsh -l