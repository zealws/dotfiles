export GOPATH="$HOME/go"
export EDITOR=vim

PATH="$GOPATH/bin:$PATH"

# Color Prompt
PS1="\[\033[01;32m\]\u@\h\[\033[01;34m\] \w \\$\[\033[00m\] "

# Aliases
alias dir="dir --color=auto"
alias grep="grep --color=auto"
alias ls="ls --color=auto"
alias lkj='cd go/src/github.com/zfjagann'
alias g='git'

# SSH Agent Info
[ -f "$HOME/.agent.rc" ] && . "$HOME/.agent.rc" &>/dev/null
