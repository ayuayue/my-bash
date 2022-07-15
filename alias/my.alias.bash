#!/usr/bin/env bash
PROXY="http://"
PROXY+=`route -n | grep UG | awk '{print $2}' | awk -F . '{print $1"."$2"."$3".1"}'`
PROXY+=":7890"
alias rm='rm -i'
# alias cp='cp -i' 
alias mv='mv -i'

alias ll="ls -alh --time-style '+%Y/%m/%d %H:%M:%S'"

alias proxy="export http_proxy=$PROXY && export https_proxy=$PROXY"
alias unproxy="unset http_proxy && unset https_proxy"

# yum install man-pages-zh-CN
alias cman="man -M /usr/share/man/zh_CN"

# dnmp alias
alias dnginx='docker exec -it nginx /bin/sh'
alias dphp='docker exec -it php sh'
alias dphp8='docker exec -it php8 sh'
alias dphp71='docker exec -it php71 /bin/sh'
alias dphp56='docker exec -it php56 /bin/sh'
alias dphp54='docker exec -it php54 /bin/sh'
alias dmysql='docker exec -it mysql /bin/bash'
alias dmysql5='docker exec -it mysql5 /bin/bash'
alias dredis='docker exec -it redis /bin/sh'
alias dnode='docker exec -it node /bin/sh'
alias dpy='docker exec -it python /bin/sh'
alias des='docker exec -it elasticsearch /bin/bash'
alias doracle='docker exec -it oracle11g /bin/bash'

# bashrc
alias sbrc="source $HOME/.bashrc"
alias cbrc="cat $HOME/.bashrc"
alias vbrc="vim $HOME/.bashrc"

