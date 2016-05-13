export ZSH=$HOME/.oh-my-zsh

if [ -f $HOME/.oh-my-zsh-themes/odin.zsh-theme ]; then
    ZSH_THEME="odin"
else
    ZSH_THEME="gallois"
fi

plugins=(git ssh-agent git-extras git-flow django pip brew tig gulp)

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

export NODE_PATH="/usr/local/lib/node"
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$HOME/bin"
export PATH="/usr/local/share/npm/bin:$PATH"
source $ZSH/oh-my-zsh.sh

alias vimconfig="nvim ~/.vim/vimrc"
alias zshconfig="nvim ~/.zshrc"
alias zshreload="source ~/.zshrc"
alias ohmyzsh="nvim ~/.oh-my-zsh"
alias vim="nvim"
alias vi="vim -u $HOME/.vim/vimrcmin"
alias rmr="rm -r"
alias cpr="cp -R"

export EDITOR=nvim
if [ -f /usr/local/bin/python3 ]; then
    VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python3
elif [ -f /usr/bin/python3 ]; then
    VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3
fi

export VIRTUALENVWRAPPER_PYTHON
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/Devel
export EDITOR=nvim
if [ -f /usr/local/bin/virtualenvwrapper.sh ]; then
    source /usr/local/bin/virtualenvwrapper.sh
elif [ -f /usr/bin/python3 ]; then
    source /usr/bin/virtualenvwrapper.sh
fi

# Add environment variable COCOS_CONSOLE_ROOT for cocos2d-x
export COCOS_CONSOLE_ROOT=/Users/arlefreak/Library/cocos2d-x-3.9/tools/cocos2d-console/bin
export PATH=$COCOS_CONSOLE_ROOT:$PATH

# Add environment variable COCOS_TEMPLATES_ROOT for cocos2d-x
export COCOS_TEMPLATES_ROOT=/Users/arlefreak/Library/cocos2d-x-3.9/templates
export PATH=$COCOS_TEMPLATES_ROOT:$PATH

# Add environment variable NDK_ROOT for cocos2d-x
export NDK_ROOT=/usr/local/Cellar/android-ndk/r10e
export PATH=$NDK_ROOT:$PATH

# Add environment variable ANDROID_SDK_ROOT for cocos2d-x
export ANDROID_SDK_ROOT=/usr/local/Cellar/android-sdk/24.4.1_1
export PATH=$ANDROID_SDK_ROOT:$PATH
export PATH=$ANDROID_SDK_ROOT/tools:$ANDROID_SDK_ROOT/platform-tools:$PATH

# Add environment variable ANT_ROOT for cocos2d-x
export ANT_ROOT=/usr/local/Cellar/ant/1.9.6/bin
export PATH=$ANT_ROOT:$PATH
function gi() { curl -L -s https://www.gitignore.io/api/$@ ;}
