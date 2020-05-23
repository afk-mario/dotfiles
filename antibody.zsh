source <(antibody init)

antibody bundle < ~/.dotfiles/zsh_plugins.txt

# So comments show up, previously they were invisible (see
# https://github.com/zsh-users/zsh-syntax-highlighting/issues/510).
ZSH_HIGHLIGHT_STYLES[comment]='none'
