#!/usr/bin/env bash
# eval "$(jump shell)"
#rpm -e jump-0.40.0-1.x86_64 &> /dev/null
#rpm -e jump-0.40.0-1.x86_64
#rpm -iv "$PLUGIN_DIR/jump-0.40.0-1.x86_64.rpm" &> /dev/null
#rpm -iv "$PLUGIN_DIR/jump-0.40.0-1.x86_64.rpm"

JUMP=`rpm -qa | grep jump`

if [ 'jump-0.40.0-1.x86_64' != "$JUMP" ]; then
     echo "jump 未安装,请使用命令 rpm -iv ./plugins/jump-0.40.0-1.x86_64.rpm 进行安装"
     exit
fi


eval "$(jump shell --bind=j)"