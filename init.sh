#!/usr/bin/env bash

SHELL=$SHELL
BASHRC=$HOME/.bashrc
BASH_DIR="/www/my-bash"
ENABLE_DIR=$BASH_DIR/enabled
ALIAS_DIR=$BASH_DIR/alias
PLUGIN_DIR=$BASH_DIR/plugins

HSTR=`yum list installed | grep hstr | awk '{print $1}'`
JUMP=`rpm -qa | grep jump`

checkEnv() {
echo '初始化 my-bash 检查运行环境 ...'
if [ $SHELL != '/bin/bash' ]; then
     echo "默认shell不是/bin/bash,运行结束"
     exit
fi

if [ $BASH_DIR != '/www/my-bash' ]; then
     echo "请将改脚本放入 /www/my-bash 目录下运行"
     exit
fi

if [ ! -f ~/.bashrc ]; then
     echo ".bashrc文件不存在,无法开启"
     exit
fi

if [ "$HSTR" != "hstr.x86_64" ]; then
     echo "hstr 未安装,请执行 yum install hstr -y 进行安装"
     exit
fi

if [ 'jump-0.40.0-1.x86_64' != "$JUMP" ]; then
     echo "jump 未安装,请使用命令 rpm -iv ./plugins/jump-0.40.0-1.x86_64.rpm 进行安装"
     exit
fi
}

load_file(){
  for file in $ENABLE_DIR/*; do
    source $file
done
echo '初始化文件完成'
}

add_bashrc(){
if [ `grep -c "source $BASH_DIR/init.sh" $BASHRC` -ne '0' ];then
    echo "配置文件已引入,跳过"
else
    echo "source $BASH_DIR/init.sh" >> $BASHRC
    echo "配置引入完成,请执行 source $BASHRC 更新bashrc文件"
fi

}

bash_init() {
    checkEnv
    ln -s $ALIAS_DIR/*.bash $ENABLE_DIR/ &> /dev/null
    ln -s $PLUGIN_DIR/*.bash $ENABLE_DIR/ &> /dev/null
    load_file
    add_bashrc
}

if [ "$(ls -A $ENABLE_DIR)" ]; then
     echo "$ENABLE_DIR 不为空,即将清空并重新生成文件"
     rm -f $ENABLE_DIR/*
     bash_init
else
     bash_init
fi


