export GOPATH="$HOME/go"
export EDITOR=vim

PATH="$GOPATH/bin:$PATH"

# Color Prompt
PS1="\[\033[01;32m\]\u@\h\[\033[01;34m\] \w \\$\[\033[00m\] "

# Aliases
alias dir="dir --color=auto"
alias grep="grep --color=auto"
alias ls="ls --color=auto"
alias g='git'

# SSH Agent Info
[ -f "$HOME/.agent.rc" ] && . "$HOME/.agent.rc" &>/dev/null

ssh-agent() {
    if [ -z "$@" ] ; then
        /usr/bin/ssh-agent > .agent.rc
        . ~/.agent.rc
    else
        /usr/bin/ssh-agent "$@"
    fi
}

# Workspace Navigation Helper
WORKSPACE="$GOPATH/src/github.com/zfjagann"
lkj() {
    mkdir -p "$WORKSPACE"
    if [ -z "$1" ] ; then
        cd "$WORKSPACE"
    else
        cd "$WORKSPACE/$1"
    fi
}
