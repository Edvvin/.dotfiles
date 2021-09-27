#########################
# History
#########################
HISTFILE=$HOME/.cache/zsh/history
HISTSIZE=10000000
SAVEHIST=10000000

setopt extended_history
setopt inc_append_history
setopt share_history
setopt hist_ignore_dups
setopt hist_ignore_all_dups
setopt hist_expire_dups_first
setopt hist_save_no_dups
setopt hist_ignore_space
setopt hist_verify

#########################
# Conda
#########################
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/edvin/Anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/edvin/Anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/edvin/Anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/edvin/Anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

export EDITOR=vim
export BROWSER=firefox

#########################
# Autocomplete
#########################
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
comp_options+=(globdots)

#########################
# Key settings
#########################

bindkey '^P' up-line-or-search
bindkey '^N' down-line-or-search
bindkey '^H' history-incremental-search-backward

# Vim keys for complete menu
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

#########################
# Vim mode
#########################
bindkey -v
export KEYTIMEOUT=1

# different cursors for different modes
function zle-keymap-select () {
    case $KEYMAP in
        vicmd) echo -ne '\e[1 q';;
        viins|main) echo -ne '\e[5 q';;
    esac
}
zle -N zle-keymap-select

# init in normal mode
zle-line-init() {
    zle -K viins
    echo -ne '\e[5 q'
}
zle -N zle-line-init

echo -ne '\e[5 q'
preexec() {echo -ne '\e[5 q' ;}

autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

# To make vim mode work more fluently
# i.e. not to pause when changeing modes
bindkey -M vicmd '^[' undefined-key
bindkey -rM viins '^X'
bindkey -M viins '^X,' _history-complete-newer \
                 '^X/' _history-complete-older \
                 '^X`' _bash_complete-word


#########################
# Aliases
#########################
alias pacup='sudo pacman -Syu'
alias pacs='pacman -Ss'
alias pacins='sudo pacman -S'
alias pacr='sudo pacman -Rs'
alias pacr='pacman -Q'
alias ..="cd .."

#########################
# Colors
#########################
autoload -U colors && colors
PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "
setopt autocd
stty stop undef
setopt interactive_comments

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh 2>/dev/null
