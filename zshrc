if [[ "$OSTYPE" == "linux-gnu" ]]; then
    source ~/.dotfiles/minzshrc
elif [[ "$OSTYPE" == "darwin"* ]]; then
    source ~/.dotfiles/bigzshrc
elif [[ "$OSTYPE" == "cygwin" ]]; then
    source ~/.dotfiles/minzshrc
elif [[ "$OSTYPE" == "msys" ]]; then
    source ~/.dotfiles/minzshrc
elif [[ "$OSTYPE" == "win32" ]]; then
    source ~/.dotfiles/minzshrc
elif [[ "$OSTYPE" == "freebsd"* ]]; then
    source ~/.dotfiles/minzshrc
else
fi
