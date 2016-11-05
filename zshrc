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

export PATH="$HOME/bin:$PATH"
export PATH=/usr/local/bin:$PATH
export PATH="$HOME/.cargo/bin:$PATH"

export HAXE_STD_PATH="/usr/local/lib/haxe/std"
export ADBI_INSTALL_PATH="$HOME/Builds/Android/"

alias vimconfig="nvim ~/.vim/vimrc"
alias zshconfig="nvim ~/.zshrc"
alias zshreload="source ~/.zshrc"
alias vim="nvim"
alias vimdiff="nvim -d"
alias vi="vim -u $HOME/.vim/vimrcmin"
alias ls="ls --color=auto"
alias ag='ag --path-to-ignore ~/.agignore'
alias tre='tree -C -L 2'

if [[ "$OSTYPE" == "linux-gnu" ]]; then
    export RUST_SRC_PATH=~/.multirust/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src
elif [[ "$OSTYPE" == "darwin"* ]]; then
    # Mac OSX
    export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
elif [[ "$OSTYPE" == "cygwin" ]]; then
        # POSIX compatibility layer and Linux environment emulation for Windows
elif [[ "$OSTYPE" == "msys" ]]; then
        # Lightweight shell and GNU utilities compiled for Windows (part of MinGW)
elif [[ "$OSTYPE" == "win32" ]]; then
        # I'm not sure this can happen.
elif [[ "$OSTYPE" == "freebsd"* ]]; then
        # ...
else
        # Unknown.
fi

export EDITOR=nvim

autoload -z edit-command-line 
zle -N edit-command-line
bindkey "^X^E" edit-command-line

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

zplug "plugins/git", from:oh-my-zsh, if:"(( $+commands[git] ))"
zplug "plugins/ssh-agent", from:oh-my-zsh
zplug "lib/clipboard", from:oh-my-zsh, if:"[[ $OSTYPE == *darwin* ]]"
zplug "lib/directories", from:oh-my-zsh
zplug "zsh-users/zsh-completions"
zplug "unixorn/git-extra-commands"

# Go up in the directory tree without aliases
zplug "peterhurford/up.zsh"

# zsh-substring-search
# You can type in any part of any command from history,
# press chosen keys and cycle through matches.
# https://github.com/zsh-users/zsh-history-substring-search
zplug "zsh-users/zsh-history-substring-search"
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

# zsh-syntax-highlighting
# Syntax highlighing for the command line.
# https://github.com/zsh-users/zsh-syntax-highlighting
zplug "zsh-users/zsh-syntax-highlighting", nice:19

# alias-tips
# Reminds you of aliases you have already.
# https://github.com/djui/alias-tips
zplug "djui/alias-tips", nice:9

# extract
# Extracts a wide variety of archive formats.
# https://github.com/xvoland/Extract
zplug "xvoland/Extract", use:"*.sh"

# Directory listings for zsh with git features.
# https://github.com/supercrabtree/k
zplug "supercrabtree/k"

# z
# Navigate your most used directories based on 'frecency'.
# https://github.com/rupa/z
zplug "rupa/z", use:"*.sh"

# A simple zsh function to make management of zsh named directories easier. 
# https://github.com/MikeDacre/cdbk
zplug "MikeDacre/cdbk"

zplug "baskerville/bspwm", use: "contrib/zsh_completion"
zplug "jonas/tig", use: "contrib/tig-completion.zsh"

# Theme
# zplug "arlefreak/odin", nice:19
# zplug "~/.zsh/Odin", from:local, nice:19
zplug "subnixr/minimal"

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# Then, source plugins and add commands to $PATH
zplug load --verbose
