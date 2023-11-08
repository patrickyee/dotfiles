# NOTE: add this to ~/.zshrc. near to the end, but before `source ~/.p10k.zsh`
#
# source ~/git/dotfiles/zshrc
#
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"

plugins=(git aws pyenv fzf docker ripgrep tig terraform vi-mode)

if [ -f ~/git/ttam-config/zshrc ]; then
	source ~/git/ttam-config/zshrc
fi

alias vi='nvim'
export PATH=$HOME/bin:$PATH
