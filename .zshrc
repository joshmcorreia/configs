alias grep='grep --color=auto'
alias ls='eza'
alias ll='ls -la'
alias psag='ps auxww | grep'
alias pubip='curl icanhazip.com'
alias size='du -sh'
alias sui='sudo -i'
alias untar='tar -xzf'

# ignores duplicated history entries when pressing up/down in terminal
setopt histignoredups
#set history size
export HISTSIZE=10000
#save history after logout
export SAVEHIST=10000
#history file
export HISTFILE=~/.zsh_history
#append into history file
setopt INC_APPEND_HISTORY
#save only one command if 2 common are same and consistent
setopt HIST_IGNORE_DUPS
#add timestamp for each entry
setopt EXTENDED_HISTORY

export GREP_COLORS='ms=01;31'

# https://stackoverflow.com/a/20277787
mem()
{
	ps -eo rss,pid,euser,args:100 --sort %mem | grep -v grep | grep -i $@ | awk '{printf $1/1024 "MB"; $1=""; print }'
}

eval "$(starship init zsh)"

. "$HOME/.atuin/bin/env"

eval "$(atuin init zsh)"

# output of `zellij setup --generate-auto-start zsh`
if [[ -z "$ZELLIJ" ]]; then
    if [[ "$ZELLIJ_AUTO_ATTACH" == "true" ]]; then
        zellij attach -c
    else
        zellij
    fi

    if [[ "$ZELLIJ_AUTO_EXIT" == "true" ]]; then
        exit
    fi
fi
