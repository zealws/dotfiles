# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

[ -z "$TMPDIR" ] && export TMPDIR=/tmp

export PATH="$PATH:$HOME/bin"

alias vim='vim -p'
alias rm='nocorrect rm'
alias ssh-agent='ssh-agent && setup-ssh-agent'
alias yao='yaourt'
alias g='git'
alias v='vagrant'
alias subl="subl3"

export EDITOR=vim
export VISUAL=vim

export GOPATH="$HOME/go"

# SSH Agent
setup-ssh-agent() {
    SSH_AGENT_PID=$(ps aux | grep ssh-agent | grep -v grep | awk '{print $2}')
    if [ -n "$SSH_AGENT_PID" ] ; then
        SSH_AUTH_SOCK=$(ls $TMPDIR/ssh*/agent.*)
        export SSH_AGENT_PID
        export SSH_AUTH_SOCK
        echo "Connected to SSH agent($SSH_AGENT_PID) on $SSH_AUTH_SOCK"
    fi
}

setup-ssh-agent &>/dev/null
