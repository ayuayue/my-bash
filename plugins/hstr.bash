#!/usr/bin/env bash
#yum remove -y hstr &> /dev/null
#yum remove -y hstr
#yum install -y htsr &> /dev/null
#yum install -y hstr
#HAS_CONF=`cat ~/.bashrc | grep HH_CONFIG -o`
HSTR=`yum list installed | grep hstr | awk '{print $1}'`

if [ "$HSTR" != "hstr.x86_64" ]; then
     echo "hstr 未安装,请执行 yum install hstr -y 进行安装"
     exit
fi

HAS_CONF=`cat $BASHRC | grep -o "HH_CONFIG" `

if [ "$HAS_CONF" != 'HH_CONFIG' ];then
    hstr --show-configuration >> ~/.bashrc
fi
