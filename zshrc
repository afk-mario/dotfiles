# no beep sound when complete list displayed
setopt nolistbeep

# historical backward/forward search with linehead string binded to ^P/^N
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end
bindkey '^R' history-incremental-search-backward

# export original variable
# Command history configuration
HISTFILE=$HOME/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000
setopt hist_ignore_dups  # ignore duplication command history list
setopt hist_ignore_space # ignore when commands starts with space
setopt share_history     # share command history data

export PATH="$HOME/bin/:$PATH"
export PATH=/usr/local/bin:$PATH

alias vimconfig="nvim ~/.vim/vimrc"
alias zshconfig="nvim ~/.zshrc"
alias zshreload="source ~/.zshrc"
alias vim="nvim"
alias vimdiff="nvim -d"
alias vi="vim -u $HOME/.vim/vimrcmin"

export EDITOR=nvim

#VirtualEnvWrapper

if [ -f /usr/local/bin/python3 ]; then
    VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python3
elif [ -f /usr/bin/python3 ]; then
    VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3
fi

export VIRTUALENVWRAPPER_PYTHON
export WORKON_HOME=$HOME/.virtualenvs

if [ -f /usr/local/bin/virtualenvwrapper.sh ]; then
    source /usr/local/bin/virtualenvwrapper.sh
elif [ -f /usr/bin/python3 ]; then
    source /usr/bin/virtualenvwrapper.sh
fi

function gi() { curl -L -s https://www.gitignore.io/api/$@ ;}

# ZPLUG config and load
if [ -d /usr/local/opt/zplug ]; then
    ZPLUG_HOME=/usr/local/opt/zplug
elif [ -d $HOME/.zplug ]; then
    ZPLUG_HOME=$HOME/.zplug
fi

export ZPLUG_HOME
source $ZPLUG_HOME/init.zsh

# Plugins
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-syntax-highlighting", nice:10

zplug "djui/alias-tips"
zplug "MikeDacre/cdbk"

zplug "plugins/git", from:oh-my-zsh, nice:10, if:"(( $+commands[git] ))"
zplug "plugins/tig", from:oh-my-zsh, nice:10, if:"(( $+commands[tig] ))"
zplug "plugins/ssh-agent", from:oh-my-zsh
zplug "lib/completion", from:oh-my-zsh
zplug "lib/clipboard", from:oh-my-zsh, if:"[[ $OSTYPE == *darwin* ]]"
zplug "lib/directories", from:oh-my-zsh

# Theme
# zplug "tylerreckart/odin"
# zplug "S1cK94/minimal"
zplug "denysdovhan/spaceship-zsh-theme"

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# Then, source plugins and add commands to $PATH
zplug load --verbose
