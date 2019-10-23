# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/bkiran/.oh-my-zsh"

case $TERM in
  xterm*)
    precmd () {print -Pn "\e]0;%~\a"}
    ;;
esac

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
# ZSH_THEME="robbyrussell"
ZSH_THEME="powerlevel10k/powerlevel10k"

POWERLEVEL9K_MODE='awesome-patched'

# Disable dir/git icons
POWERLEVEL9K_HOME_ICON=''
POWERLEVEL9K_HOME_SUB_ICON=''
POWERLEVEL9K_FOLDER_ICON=''

DISABLE_AUTO_TITLE="true"

POWERLEVEL9K_VCS_GIT_ICON=''
POWERLEVEL9K_VCS_STAGED_ICON='\u00b1'
POWERLEVEL9K_VCS_UNTRACKED_ICON='\u25CF'
POWERLEVEL9K_VCS_UNSTAGED_ICON='\u00b1'
POWERLEVEL9K_VCS_INCOMING_CHANGES_ICON='\u2193'
POWERLEVEL9K_VCS_OUTGOING_CHANGES_ICON='\u2191'

POWERLEVEL9K_VCS_MODIFIED_BACKGROUND='yellow'
POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND='yellow'
#POWERLEVEL9K_VCS_UNTRACKED_ICON='?'

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(status os_icon context dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(background_jobs virtualenv rbenv rvm time)

POWERLEVEL9K_SHORTEN_STRATEGY="truncate_middle"
POWERLEVEL9K_SHORTEN_DIR_LENGTH=4

POWERLEVEL9K_TIME_FORMAT="%D{%H:%M \uE868  %d.%m.%y}"

POWERLEVEL9K_STATUS_VERBOSE=false
export DEFAULT_USER="$USER"
# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

### BASH PROFILE STUFF

export AWS_DEFAULT_REGION=eu-west-1
export ACCESS_TOKEN="insert-github-access-token here"
export EDITOR=vim

export NVM_DIR=~/.nvm
source $NVM_DIR/nvm.sh

### SCLOUD - shell integration
command -v scloud >/dev/null 2>&1 && eval "$(scloud --shell zsh)"
### SCLOUD

aws_login() { 
    eval "$(scloud account login -e "$1" "$2")"
}

alias ll='ls -al'
alias srv='~/git/fed-script/bin/srv'

alias scloud-dr='aws_login as24dev ReadOnlyAccess'
alias scloud-dp='aws_login as24dev PowerUserAccess'
alias scloud-pr='aws_login as24prod ReadOnlyAccess'
alias scloud-pp='aws_login as24prod PowerUserAccess'
alias scloud-tr='aws_login as24tools ReadOnlyAccess'
alias scloud-tp='aws_login as24tools PowerUserAccess'
alias scloud-playr='aws_login s24-playground ReadOnlyAccess'
alias scloud-playp='aws_login s24-playground PowerUserAccess'
alias scloud-searchr='aws_login as24-search-funnel ReadOnlyAccess'
alias scloud-searchp='aws_login as24-search-funnel PowerUserAccess'

alias delete-local-branches="git branch | grep -v "master" | xargs git branch -d"
alias force-delete-local-branches="git branch | grep -v "master" | xargs git branch -D"

mygroups(){
	ldapsearch -x -W -LLL -h gs24.com -b 'OU=users,OU=gs24,DC=gs24,DC=com' -D 'bayram.kiran@scout24.com' "(sAMAccountName=$USER)" memberof | grep -- '-RO-' | awk -F '[=,]' '{print $2}'
}

goto(){
	tmp="$(find ~/git -maxdepth 1 -type d | grep "$1" | tail -n 1)"
	cd $tmp
}

clone(){
	cd ~/git
	git clone git@github.com:Scout24/$1.git
	cd $1
}

clonefork(){
	cd ~/git
	git clone git@github.com:kiranbayram/$1.git
	cd $1
	git remote add upstream git@github.com:Scout24/$1.git
	git remote -v
}

run-slice-in-jigsaw(){
	cd ~/git/jigsaw
	./run_local.sh financeslice_detail 9000
}

run-classified-detail-in-jigsaw(){
	cd ~/git/jigsaw
	./run_local.sh classifieddetail 9000
}

run-pages-in-jigsaw(){
	cd ~/git/jigsaw
	./run_local.sh finance_pages 9000
}

run-afterlead-in-jigsaw(){
	cd ~/git/jigsaw
	./run_local.sh finance_afterlead 9000
}

run-autopos-in-jigsaw(){
	cd ~/git/jigsaw
	./run_local.sh finance_autopos 9000
}

PATH="$PATH:/Users/bkiran/Library/Python/2.7/bin"

autoload bashcompinit
bashcompinit
source ~/git/albert/bash_completion
alias albert="~/git/albert/albert"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh

prompt_scloud() { p9k_prompt_segment -t "$(__scloud_ps1 | sed -e 's/[[:space:]]*$//')" }
typeset -g POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(scloud $POWERLEVEL9K_LEFT_PROMPT_ELEMENTS)

