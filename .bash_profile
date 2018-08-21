#!/bin/bash

export AWS_DEFAULT_REGION=eu-west-1

### SCLOUD - shell integration
command -v scloud >/dev/null 2>&1 && eval "$(scloud --shell bash)"
### SCLOUD

alias dynamodb-local='java -Djava.library.path=/Users/bayramkiran/libs/dynamodb-local/DynamoDBLocal_lib -jar /Users/bayramkiran/libs/dynamodb-local/DynamoDBLocal.jar -sharedDb'

if [ $ITERM_SESSION_ID ]; then
  export PROMPT_COMMAND='echo -ne "\033];${PWD##*/}\007"; ':"$PROMPT_COMMAND";
fi

source ~/git-completion.bash
source ~/.profile
source ~/.rvm/scripts/rvm

alias ll='ls -al'

alias scloud-dr='scloud account login as24dev ReadOnlyAccess'
alias scloud-dp='scloud account login as24dev PowerUserAccess'
alias scloud-pr='scloud account login as24prod ReadOnlyAccess'
alias scloud-pp='scloud account login as24prod PowerUserAccess'
alias scloud-tr='scloud account login as24tools ReadOnlyAccess'
alias scloud-tp='scloud account login as24tools PowerUserAccess'

alias delete-local-branches="git branch | grep -v "master" | xargs git branch -d"
alias force-delete-local-branches="git branch | grep -v "master" | xargs git branch -D"

goto(){
	tmp="$(find ~/git -maxdepth 1 -type d | grep $1 | head -n 1)"
	cd $tmp
}

clone(){
	cd ~/git
	git clone git@github.com:Scout24/$1.git
	cd $1
}

run-slice-in-jigsaw(){
	cd ~/git/jigsaw-docker
	scloud-dr
	./run.sh financeslice_detail 9000
}

run-pages-in-jigsaw(){
	cd ~/git/jigsaw-docker
	scloud-dr
	./run.sh finance_pages 9000
}

run-afterlead-in-jigsaw(){
	cd ~/git/jigsaw-docker
	scloud-dr
	./run.sh finance_afterlead 9000
}

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
