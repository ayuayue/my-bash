# Some good standards, which are not used if the user
# creates his/her own .bashrc/.bash_profile

# --show-control-chars: help showing Korean or accented characters
alias ls='ls -F --color=auto --show-control-chars'
alias ll="ls -alh --time-style '+%Y/%m/%d %H:%M:%S'"
PROXY="http://"
PROXY+="127.0.0.1"
PROXY+=":7890"
alias proxy="export http_proxy=$PROXY && export https_proxy=$PROXY"
alias unproxy="unset http_proxy && unset https_proxy"
alias vimenv="vim /etc/profile.d/env.sh"
alias vimhosts="vim /etc/hosts"
alias refreshhosts="cat /etc/hosts/hosts > /c/system32/drivers/etc/hosts/hosts"
alias refreshenv="source /etc/profile"


case "$TERM" in
xterm*)
	# The following programs are known to require a Win32 Console
	# for interactive usage, therefore let's launch them through winpty
	# when run inside `mintty`.
	for name in node ipython php php5 psql python2.7
	do
		case "$(type -p "$name".exe 2>/dev/null)" in
		''|/usr/bin/*) continue;;
		esac
		alias $name="winpty $name.exe"
	done
	;;
esac
