if [[ "$OSTYPE" == "linux-gnu" ]]; then
    source ~/.dotfiles/zshrc.big
elif [[ "$OSTYPE" == "darwin"* ]]; then
    source ~/.dotfiles/zshrc.big
elif [[ "$OSTYPE" == "cygwin" ]]; then
    source ~/.dotfiles/zshrc.min
elif [[ "$OSTYPE" == "msys" ]]; then
    source ~/.dotfiles/zshrc.min
elif [[ "$OSTYPE" == "win32" ]]; then
    source ~/.dotfiles/zshrc.min
elif [[ "$OSTYPE" == "freebsd"* ]]; then
    source ~/.dotfiles/zshrc.min
else
fi
