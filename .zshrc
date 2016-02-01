ZSH=/home/marioc/.oh-my-zsh

ZSH_THEME="odin"
plugins=(git django pip brew tig gulp node npm)

EDITOR=nvim

export NODE_PATH="/usr/local/lib/node"
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$HOME/bin"
export PATH="/usr/local/share/npm/bin:$PATH"
source $ZSH/oh-my-zsh.sh

alias vimconfig="nvim ~/.vim/vimrc"
alias zshconfig="nvim ~/.zshrc"
alias zshreload="source ~/.zshrc"
alias ohmyzsh="nvim ~/.oh-my-zsh"
alias vim="nvim"
alias updateDotFiles="cp -R ~/.vim ~/Github/dotfiles"
alias loadDotFiles="cp -R ~/Github/dotfiles/.vim ~/"
alias rmr="rm -r"

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

function gi() { curl -L -s https://www.gitignore.io/api/$@ ;}
function extract()      # Handy Extract Program
{
    if [ -f $1 ] ; then
        case $1 in
            *.tar.bz2)   tar xvjf "$1"    ;;  
            *.tar.gz)    tar xvzf "$1"    ;;  
            *.bz2)       bunzip2 "$1"     ;;  
            *.rar)       unrar x "$1"     ;;  
            *.gz)        gunzip "$1"      ;;  
            *.tar)       tar xvf "$1"     ;;  
            *.tbz2)      tar xvjf "$1"    ;;  
            *.tgz)       tar xvzf "$1"    ;;
            *.zip)       unzip "$1"       ;;
            *.Z)         uncompress "$1"  ;;
            *.7z)        7z x "$1"        ;;
            *)           echo "'$1' cannot be extracted via >extract<" ;;
        esac
    else
        echo "'$1' is not a valid file!"
    fi
}
