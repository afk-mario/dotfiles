if [[ "$OSTYPE" == "linux-gnu" ]]; then
    source ~/.dotfiles/zshrc.big.zsh
elif [[ "$OSTYPE" == "darwin"* ]]; then
    source ~/.dotfiles/zshrc.big.zsh
elif [[ "$OSTYPE" == "linux-gnueabihf" ]]; then
    source ~/.dotfiles/zshrc.big.zsh
else
    source ~/.dotfiles/zshrc.min.zsh
fi
