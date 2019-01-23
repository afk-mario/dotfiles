source ~/.zplug/init.zsh

# Plugins

zplug 'zplug/zplug', hook-build:'zplug --self-manage'

zplug "plugins/ssh-agent", from:oh-my-zsh
zplug "lib/directories", from:oh-my-zsh

zplug "plugins/git", from:oh-my-zsh, if:"(( $+commands[git] ))"
zplug "plugins/cargo", from:oh-my-zsh, use:"plugins/cargo/_cargo"
zplug "lib/clipboard", from:oh-my-zsh

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
zplug "zsh-users/zsh-syntax-highlighting", defer:3

# alias-tips
# Reminds you of aliases you have already.
# https://github.com/djui/alias-tips
zplug "djui/alias-tips", defer:2

# extract
# Extracts a wide variety of archive formats.
# https://github.com/xvoland/Extract
zplug "xvoland/Extract", use:"*.sh"

# z
# Navigate your most used directories based on 'frecency'.
# https://github.com/rupa/z
zplug "rupa/z", use:"*.sh"

# A simple zsh function to make management of zsh named directories easier. 
# https://github.com/MikeDacre/cdbk
zplug "MikeDacre/cdbk"

zplug "docker/cli", use: "contrib/completion/zsh/_docker"
zplug "docker/compose", use: "contrib/completion/zsh/_docker-compose"

zplug "baskerville/bspwm", use: "contrib/zsh_completion"
zplug "jonas/tig", use: "contrib/tig-completion.zsh"

zplug "sferik/t", use: "etc/t-completion.zsh"
# Add fzf command history things
zplug "junegunn/fzf", use:"shell/*.zsh"
# Theme
# zplug "arlefreak/odin", defer:19
# zplug "~/.zsh/Odin", from:local, defer:19
zplug "subnixr/minimal"



# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# Then, source plugins and add commands to $PATH
zplug load
