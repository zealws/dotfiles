export GOPATH="$HOME/go"
export EDITOR=vim

PATH="$PATH:$GOPATH/bin:$HOME/bin"

[[ -f "$HOME/.bashrc.custom" ]] && source "$HOME/.bashrc.custom"

# Color Prompt
spwd_bin=$(which spwd 2>/dev/null)
if [ -z "$spwd_bin" ] ; then
    PS1='\[\033[01;32m\]\u@\h\[\033[01;34m\] \w \\$\[\033[00m\] '
else
    PS1="\[\033[01;32m\]\u@\h\[\033[01;34m\] \$($spwd_bin) \\$\[\033[00m\] "
fi

# Aliases
alias dir="dir --color=auto"
alias grep="grep --color=auto"
alias ls="ls --color=auto"
alias g='git'
alias v='vagrant'
alias subl="subl3"
alias jurl="curl --silent -H 'Content-Type: application/json'"
alias ssh-agent='ssh-agent && setup-ssh-agent'

# SSH Agent Info
[ -f "$HOME/.agent.rc" ] && . "$HOME/.agent.rc" &>/dev/null

setup-ssh-agent() {
    SSH_AGENT_PID=$(ps aux | grep ssh-agent | grep -v grep | awk '{print $2}')
    if [ -n "$SSH_AGENT_PID" ] ; then
        SSH_AUTH_SOCK=$(ls /tmp/ssh*/agent.*)
        export SSH_AGENT_PID
        export SSH_AUTH_SOCK
        echo "Connected to SSH agent($SSH_AGENT_PID) on $SSH_AUTH_SOCK"
    fi
}

# Workspace Navigation Helper
lkj() {
    cd "$(git rev-parse --show-toplevel)"
    [ -n "$1" ] && cd "$1"
}

setup-ssh-agent &>/dev/null

save-term-profiles() {
    dconf dump /org/gnome/terminal/legacy/profiles:/ > ~/.gnome-term-profiles
}

load-term-profiles() {
    dconf load /org/gnome/terminal/legacy/profiles:/ < ~/.gnome-term-profiles
}
