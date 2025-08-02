alias grep='grep --color=auto'

# if `eza` is installed then replace `ls` with `eza`
if [ -x "$(command -v eza)" ]; then
    alias ls='eza'
else
    alias ls='ls --color=auto'
fi

alias ll='ls -la'
alias psag='ps auxww | grep'
alias pubip='curl icanhazip.com'
alias size='du -sh'
alias sui='sudo -i'
alias untar='tar -xzf'

# podman aliases
alias pcl="podman container ls -a"
alias pil="podman image ls -a"

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
    # per https://man7.org/linux/man-pages/man1/ps.1.html, `rss` gives us the non-swapped physical memory that a task has used in kibibytes (1KiB = 2^10)
    ps -eo rss,pid,euser,args:100 --sort %mem | grep -v grep | grep -i $@ | awk '{printf $1/1024 "MiB"; $1=""; print }'
}

if [ -x "$(command -v starship)" ]; then
    eval "$(starship init zsh)"
fi

if [ -f "$HOME/.atuin/bin/atuin" ]; then
    . "$HOME/.atuin/bin/env"
    eval "$(atuin init zsh)"
fi

# don't open zellij in VSCode, otherwise we end up with a ton of sessions
if [ ! -n "$VSCODE_PID" ]; then
    # if `zellij` is installed then run it by default when a terminal is started
    if [ -x "$(command -v zellij)" ]; then
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
    fi
fi

# enable SSH autocomplete
autoload -Uz compinit
compinit
