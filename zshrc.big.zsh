# no beep sound when complete list displayed
setopt nolistbeep

# Set comments inline
setopt interactivecomments

#completition things
# https://carlosbecker.com/posts/speeding-up-zsh/
autoload -Uz compinit
compinit -d $XDG_CACHE_HOME/zsh/zcompdump-$ZSH_VERSION

for dump in ~/.zcompdump(N.mh+24); do
  compinit
done

compinit -C
autoload compaudit

# Vi mode https://dougblack.io/words/zsh-vi-mode.html
bindkey -v
export KEYTIMEOUT=1

# Command history configuration
HISTFILE=$HOME/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000

setopt hist_ignore_dups  # ignore duplication command history list
setopt hist_ignore_space # ignore when commands starts with space
setopt share_history     # share command history data

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export XKB_DEFAULT_LAYOUT="es,us"
export XKB_DEFAULT_OPTIONS="shift:both_capslock,caps:ctrl_modifier,grp:ctrls_toggle,grp:win_space_toggle"

export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_CACHE_HOME="$HOME/.cache"

export PATH="$HOME/bin:$PATH"
export PATH="$HOME/apps:$PATH"
export PATH="$HOME/apps/uxn:$PATH"
export PATH="$HOME/.itch:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="/usr/local/bin:$PATH"
export PATH="/usr/local/share/npm/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/go/bin:$PATH"
export PATH="$PATH:$(ruby -e 'print Gem.user_dir')/bin"
export PATH="$(yarn global bin):$PATH"
export PATH="$HOME/.dotnet/tools:$PATH"
export ASEPRITE_ACCEPT_EULA=yes

export ADBI_INSTALL_PATH="$HOME/builds/"
export UNITY_INSTALL_PATH="$HOME/builds/"
export UNITY_PROJECTS_PATH="$HOME/Projects/games/Unity/"

export EDITOR=nvim
export SYSTEMD_EDITOR=$EDITOR
export MANPAGER="nvim +Man!"
export PIPENV_VENV_IN_PROJECT=1
export SSH_AUTH_SOCK=~/.1password/agent.sock

export CARGO_HOME="$XDG_DATA_HOME"/cargo
export DOCKER_CONFIG="$XDG_CONFIG_HOME"/docker
export GEM_HOME=${XDG_DATA_HOME}/gem
export GEM_SPEC_CACHE=${XDG_CACHE_HOME}/gem
export GNUPGHOME="$XDG_DATA_HOME"/gnupg
export GOPATH="$XDG_DATA_HOME"/go
export GTK2_RC_FILES="$XDG_CONFIG_HOME"/gtk-2.0/gtkrc
export LESSHISTFILE=${XDG_CACHE_HOME}/less/history
export ICEAUTHORITY="$XDG_CACHE_HOME"/ICEauthority
export NODE_REPL_HISTORY="$XDG_DATA_HOME"/node_repl_history
export NPM_CONFIG_USERCONFIG=$XDG_CONFIG_HOME/npm/npmrc
export NVM_DIR="$XDG_DATA_HOME"/nvm
export _JAVA_OPTIONS=-Djava.util.prefs.userRoot="$XDG_CONFIG_HOME"/java
export PSQL_HISTORY="$XDG_DATA_HOME/psql_history"
export PYTHONSTARTUP="${XDG_CONFIG_HOME}/python/pythonrc"
export RUSTUP_HOME="$XDG_DATA_HOME"/rustup
export WEECHAT_HOME=${XDG_CONFIG_HOME}/weechat
export WINEPREFIX="$XDG_DATA_HOME"/wine
export XINITRC="$XDG_CONFIG_HOME"/X11/xinitrc
export GNUPGHOME="$XDG_DATA_HOME"/gnupg
export _Z_DATA="$XDG_DATA_HOME/z"

alias vimconfig="nvim ~/.vim/vimrc"
alias zshconfig="nvim ~/.zshrc"
alias tmux="tmux -2 -f ~/.config/tmux/tmux.conf"
alias at="tmux a -t $1"
alias tmuxconfig="nvim ~/.config/tmux/tmux.conf"
alias tmuxreload="tmux source-file ~/.config/tmux/tmux.conf"
alias zshreload="source ~/.zshrc"
alias vim="nvim"
alias vimdiff="nvim -d"
alias vi="vim -u $HOME/.vim/vimrcmin"
alias tim="nvim -U NONE -u $HOME/.vim/test.vim"
alias ls="ls --color=auto"
alias ag='ag --path-to-ignore ~/.agignore'
alias tree='tree -C'
alias tre='tree -L 2'
alias prp="pipenv run python"
alias ssh="TERM=xterm-256color ssh"
alias sway="$HOME/bin/sway-vars"
alias lg='lazygit'
alias ll='exa -lh --git'
alias pidgin='pidgin --config="$XDG_DATA_HOME"/purple'
alias weechat=weechat -d ${XDG_CONFIG_HOME}/weechat
alias wget=wget --hsts-file="$XDG_DATA_HOME/wget-hsts"

# https://stackoverflow.com/questions/1571461/git-a-quick-command-to-go-to-root-of-the-working-tree/1571525#1571525
alias groot='if [ "`git rev-parse --show-cdup`" != "" ]; then cd `git rev-parse --show-cdup`; fi'

# Cumpletitions https://github.com/rust-lang-nursery/rustup.rs/blob/master/README.md
fpath+=~/.zfunc

if [[ "$OSTYPE" == "linux-gnu" ]]; then
  # PLAYDATE
  export PLAYDATE_SDK_PATH="$HOME/Developer/PlaydateSDK"
  alias pdc="pdc -sdkpath $PLAYDATE_SDK $1"
  export PATH="$HOME/Developer/$PLAYDATE_SDK/bin:$PATH"

  # NVM
  [ -z "$NVM_DIR" ] && export NVM_DIR="$HOME/.nvm"
  source /usr/share/nvm/nvm.sh
  source /usr/share/nvm/bash_completion
  source /usr/share/nvm/install-nvm-exec

  # FLY.io
  export FLYCTL_INSTALL="/home/afk/.fly"
  export PATH="$FLYCTL_INSTALL/bin:$PATH"

  # Foot

  source ~/.dotfiles/foot.zsh
  alias gd4="$HOME/apps/Godot/Godot4"

elif [[ "$OSTYPE" == "darwin"* ]]; then # macOS
  export ANDROID_SDK_ROOT=/usr/local/share/android-sdk
  export LIBRARY_PATH="/usr/local/lib"
  export PATH="$PATH:$ANDROID_SDK_ROOT/tools"
  export PATH="$PATH:$ANDROID_SDK_ROOT/platform-tools"
  export PATH="$PATH:/usr/local/bin/tidy"
  export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
  export PATH="/Applications/Transmission.app/Contents/MacOS/:$PATH"
  export PATH="/Library/TeX/texbin:$PATH"
  export PATH="$HOME/Library/Python/2.7/bin:$PATH"
  alias ctags="`brew --prefix`/bin/ctags"
  export OPENSSL_INCLUDE_DIR=`brew --prefix openssl`/include
  export OPENSSL_LIB_DIR=`brew --prefix openssl`/lib
  # https://github.com/sfackler/rust-openssl/issues/255

  # https://stackoverflow.com/questions/1348842/what-should-i-set-java-home-to-on-osx
  # export JAVA_HOME=$(/usr/libexec/java_home)
  # export RUST_SRC_PATH="$(rustc --print sysroot)/lib/rustlib/src/rust/src/"
  export GPG_TTY=$(tty)
fi

# Load fzf if present
# https://github.com/getantibody/antibody/issues/222
if test -d /usr/share/fzf; then
  source /usr/share/fzf/key-bindings.zsh
elif test -d /usr/local/opt/fzf/shell; then
  . /usr/local/opt/fzf/shell/key-bindings.zsh
else
  # historical backward/forward search with linehead string binded to ^P/^N
  autoload history-search-end
  zle -N history-beginning-search-backward-end history-search-end
  zle -N history-beginning-search-forward-end history-search-end
  bindkey "^P" history-beginning-search-backward-end
  bindkey "^N" history-beginning-search-forward-end
  bindkey '^R' history-incremental-search-backward
  bindkey '^[[A' history-substring-search-up
  bindkey '^[[B' history-substring-search-down
  bindkey -M vicmd 'k' history-substring-search-up
  bindkey -M vicmd 'j' history-substring-search-down
fi

# https://gist.github.com/fredw08/1999371
zstyle ':completion:*:*:kill:*' menu yes select
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:*:kill:*:processes' command 'ps xo pid,user:10,cmd | rg -v "sshd:|-zsh$"'

# source ~/.dotfiles/zplug.zsh
source ~/.dotfiles/ssh-auto-load.zsh
source ~/.dotfiles/antibody.zsh
