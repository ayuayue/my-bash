#!/usr/bin/env bash

# env
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LD_LIBRARY_PATH="/usr/local/instantclient"
export APACHE="/usr/local/apache/bin"
export PHP="/usr/local/php/bin"
export HOME_BIN="$HOME/bin"
export GOROOT="${HOME}/.g/go"
export PATH="${HOME}/.g/go/bin:$PATH"
export G_MIRROR=https://golang.google.cn/dl/
export GOPROXY="https://proxy.golang.com.cn,direct" 
export GO111MODULE=on
export PATH=$PATH:$PHP:$HOME_BIN:$APACHE

# bind
# bind 'set show-all-if-ambiguous on'
# bind 'TAB:menu-complete'

export HISTFILE="$HOME/.bash_history"

export HISTSIZE=12000

export HISTFILESIZE=12000

export HISTCONTROL=ignoredups


export HISTTIMEFORMAT="`whoami` %F %T "

shopt -s histappend

typeset -r HISTTIMEFORMAT



# yum install -y hstr
# hstr --show-configuration

# rpm -iv ../plugins/jump-0.40.0-1.x86_64.rpm
eval "$(jump shell --bind=j)"