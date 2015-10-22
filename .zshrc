# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

[[ -z "$TMPDIR" ]] && export TMPDIR=/tmp
[[ -f "$HOME/.zshrc.custom" ]] && source "$HOME/.zshrc.custom"

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
export GOROOT="/usr/lib/go"
export PATH="$PATH:$GOPATH/bin"

# SSH Agent
setup-ssh-agent() {
    SSH_AGENT_PID=$(ps aux | grep ssh-agent | grep -v grep | awk '{print $2}')
    if [ -n "$SSH_AGENT_PID" ] ; then
        SSH_AUTH_SOCK=$(ls $TMPDIR/ssh*/agent.*)
        export SSH_AGENT_PID
        export SSH_AUTH_SOCK
        echo "Connected to SSH agent($SSH_AGENT_PID) on $SSH_AUTH_SOCK"
    fi
    if [ "$1" != "-n" ] ; then
        for x in $HOME/.ssh/id_{ecdsa,rsa} ; do
            if ssh-add -l | awk '{print $3}' | grep "$x" &>/dev/null ; then
                echo "Key already added: $x"
            else
                ssh-add "$x"
            fi
        done
    fi
}

setup-ssh-agent -n &>/dev/null
