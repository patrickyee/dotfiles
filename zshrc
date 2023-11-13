# NOTE: add this to ~/.zshrc before `source $ZSH/oh-my-zsh.sh`
#
# source ~/git/dotfiles/zshrc
#
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"

plugins=(
	aws
	docker
	fzf
	git
	pyenv
	ripgrep
	terraform
	tig
	vi-mode
	zsh-autosuggestions
	zsh-syntax-highlighting
	zsh-z
)

if [ -f ~/git/ttam-config/zshrc ]; then
	source ~/git/ttam-config/zshrc
fi

alias vi='nvim'
export PATH=$HOME/bin:$HOME/.local/bin:$PATH
export EDITOR=nvim
