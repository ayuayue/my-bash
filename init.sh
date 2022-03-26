#!/usr/bin/env bash

SHELL=$SHELL
BASHRC=$HOME/.bashrc
BASH_DIR="/www/my-bash"
ENABLE_DIR=$BASH_DIR/enabled
ALIAS_DIR=$BASH_DIR/alias
PLUGIN_DIR=$BASH_DIR/plugins

checkEnv() {
    echo '初始化 my-bash 检查运行环境 ...' &> /dev/null
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

}

load_file(){
    for file in $ENABLE_DIR/*; do
        source $file
    done
    echo '初始化文件完成' &> /dev/null
}

add_bashrc(){

    if [ `grep -c "source $BASH_DIR/init.sh" $BASHRC` -ne '0' ];then
        echo "配置文件已引入,跳过" &> /dev/null
    else
        echo "source $BASH_DIR/init.sh" >> $BASHRC
        echo "配置引入完成,请执行 source $BASHRC 更新bashrc文件" &> /dev/null
    fi

    if [ `grep -c "source $BASH_DIR/theme/theme.bash" $BASHRC` -ne '0' ];then
        echo "主题配置文件已引入,跳过" &> /dev/null
    else
        echo "source $BASH_DIR/theme/theme.bash" >> $BASHRC
        echo "主题配置引入完成,请执行 source $BASHRC 更新bashrc文件" &> /dev/null
    fi

    if [ `grep -c "source $BASH_DIR/env/my.env.bash" $BASHRC` -ne '0' ];then
        echo "环境变量配置文件已引入,跳过" &> /dev/null
    else
        echo "source $BASH_DIR/env/my.env.bash" >> $BASHRC
        echo "环境变量配置引入完成,请执行 source $BASHRC 更新bashrc文件" &> /dev/null
    fi
}

bash_init() {
    checkEnv
    ln -s $ALIAS_DIR/*.bash $ENABLE_DIR/ &> /dev/null
    # ln -s $PLUGIN_DIR/*.bash $ENABLE_DIR/ &> /dev/null
    load_file
    add_bashrc
}

if [ "$(ls -A $ENABLE_DIR)" ]; then
     echo "$ENABLE_DIR 不为空,即将清空并重新生成文件" &> /dev/null
     rm -f $ENABLE_DIR/*
     bash_init
else
     bash_init
fi
