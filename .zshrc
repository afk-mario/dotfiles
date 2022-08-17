if [[ "$OSTYPE" == "linux-gnu" ]]; then
    source ~/.dotfiles/zshrc.big.zsh
elif [[ "$OSTYPE" == "darwin"* ]]; then
    source ~/.dotfiles/zshrc.big.zsh
elif [[ "$OSTYPE" == "linux-gnueabihf" ]]; then
    source ~/.dotfiles/zshrc.big.zsh
else
    source ~/.dotfiles/zshrc.min.zsh
fi

export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
