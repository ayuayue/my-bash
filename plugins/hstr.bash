#!/usr/bin/env bash
#yum remove -y hstr &> /dev/null
#yum remove -y hstr
#yum install -y htsr &> /dev/null
#yum install -y hstr
#HAS_CONF=`cat ~/.bashrc | grep HH_CONFIG -o`

HAS_CONF=`cat $BASHRC | grep -o "HH_CONFIG" `

if [ "$HAS_CONF" != 'HH_CONFIG' ];then
    hstr --show-configuration >> ~/.bashrc
fi
echo 'hstr conf finished'