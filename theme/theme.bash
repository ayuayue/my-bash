function nonzero_return() {
	RETVAL=$?
	[ $RETVAL -ne 0 ] && echo "[ $RETVAL ]"
}

# get current branch in git repo
function parse_git_branch() {
	BRANCH=`git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'`
	if [ ! "${BRANCH}" == "" ]
	then
#		STAT=`parse_git_dirty`
#		echo "[${BRANCH}${STAT}]"
		echo "(${BRANCH})"
	else
		echo ""
	fi
}

# get current status of git repo
function parse_git_dirty {
	status=`git status 2>&1 | tee`
	dirty=`echo -n "${status}" 2> /dev/null | grep "modified:" &> /dev/null; echo "$?"`
	untracked=`echo -n "${status}" 2> /dev/null | grep "Untracked files" &> /dev/null; echo "$?"`
	ahead=`echo -n "${status}" 2> /dev/null | grep "Your branch is ahead of" &> /dev/null; echo "$?"`
	newfile=`echo -n "${status}" 2> /dev/null | grep "new file:" &> /dev/null; echo "$?"`
	renamed=`echo -n "${status}" 2> /dev/null | grep "renamed:" &> /dev/null; echo "$?"`
	deleted=`echo -n "${status}" 2> /dev/null | grep "deleted:" &> /dev/null; echo "$?"`
	bits=''
	if [ "${renamed}" == "0" ]; then
		bits=">${bits}"
	fi
	if [ "${ahead}" == "0" ]; then
		bits="*${bits}"
	fi
	if [ "${newfile}" == "0" ]; then
		bits="+${bits}"
	fi
	if [ "${untracked}" == "0" ]; then
		bits="?${bits}"
	fi
	if [ "${deleted}" == "0" ]; then
		bits="x${bits}"
	fi
	if [ "${dirty}" == "0" ]; then
		bits="!${bits}"
	fi
	if [ ! "${bits}" == "" ]; then
		echo " ${bits}"
	else
		echo ""
	fi
}
PS1="\[\e[31m\]\`nonzero_return\`\[\e[m\]"

PS1+="\[\e[33m\]\\$\[\e[m\]"

PS1+="\[\e[37m\][\[\e[m\]"
PS1+="\[\e[36m\]\u\[\e[m\]"
PS1+="\[\e[33;40m\]@\[\e[m\]"
PS1+="\[\e[36;40m\]\H\[\e[m\]"
PS1+=" at \[\e[32m\]\w\[\e[m\] "
PS1+="\[\e[37m\]]\[\e[m\]"

PS1+="\[\e[32m\]\`parse_git_branch\`\[\e[m\]"

PS1+=" : \[\e[37;40m\]\t\[\e[m\] "

PS1+="\n"
PS1+="\[\e[32m\]\s_\v\[\e[m\]"
PS1+="#> "



#PS1="\[\e[33m\]\\$\[\e[m\]\[\e[37m\][\[\e[m\]\[\e[36m\]\u\[\e[m\]\[\e[33;40m\]@\[\e[m\]\[\e[36;40m\]\h\[\e[m\]\[\e[37m\]]\[\e[m\]\[\e[32m\]\`parse_git_branch\`\[\e[m\] at \[\e[32m\]\w\[\e[m\] :\[\e[31m\]\`nonzero_return\`\[\e[m\] \[\e[37;40m\]\t\[\e[m\] \n \[\e[32m\]\s_\v\[\e[m\]#  "
export PS1