#!/usr/bin/env bash
HTTP_PROXY=http://192.168.190.1:7890
HTTPS_PROXY=http://192.168.190.1:7890
NO_PROXY=http://127.0.0.1

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias l='ls -alh'
alias ll='ls -alh'

alias proxy="export HTTP_PROXY=$HTTP_PROXY && export HTTPS_PROXY=$HTTPS_PROXY"
alias noproxy="export HTTP_PROXY=$NO_PROXY && export HTTPS_PROXY=$NO_PROXY"
alias unproxy="unset $HTTP_PROXY && unset $HTTPS_PROXY"

# dnmp alias
alias dnginx='docker exec -it nginx /bin/sh'
alias dphp='docker exec -it php sh'
alias dphp8='docker exec -it php8 sh'
alias dphp71='docker exec -it php71 /bin/sh'
alias dphp56='docker exec -it php56 /bin/sh'
alias dphp54='docker exec -it php54 /bin/sh'
alias dmysql='docker exec -it mysql /bin/bash'
alias dredis='docker exec -it redis /bin/sh'
alias dnode='docker exec -it node /bin/sh'
alias dpy='docker exec -it python /bin/sh'
alias des='docker exec -it elasticsearch /bin/bash'
alias doracle='docker exec -it oracle11g /bin/bash'

# bashrc
alias sbrc="source $HOME/.bashrc"
alias cbrc="cat $HOME/.bashrc"
alias vbrc="vim $HOME/.bashrc"