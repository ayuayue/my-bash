#!/usr/bin/env bash

# env
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LD_LIBRARY_PATH="/usr/local/instantclient"
export APACHE="/usr/local/apache/bin"
export PHP="/usr/local/php/bin"
export HOME_BIN="$HOME/bin"
export PATH=$PATH:$PHP:$HOME_BIN:$APACHE

# bind
# bind 'set show-all-if-ambiguous on'
# bind 'TAB:menu-complete'

export HISTFILE=$HOME/.bash_history

export HISTSIZE=12000

export HISTFILESIZE=12000

export HISTCONTROL=ignoredups

export HISTTIMEFORMAT="`whoami` %F %T "

shopt -s histappend

typeset -r HISTTIMEFORMAT
