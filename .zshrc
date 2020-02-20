if [[ "$OSTYPE" == "linux-gnu" ]]; then
    source ~/.dotfiles/zshrc.big
elif [[ "$OSTYPE" == "darwin"* ]]; then
    source ~/.dotfiles/zshrc.big
elif [[ "$OSTYPE" == "linux-gnueabihf" ]]; then
    source ~/.dotfiles/zshrc.big
else
    source ~/.dotfiles/zshrc.min
fi
