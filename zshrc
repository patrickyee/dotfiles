# NOTE: add this to ~/.zshrc after `antidote load`
#
# source ~/git/dotfiles/zshrc
#
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"

# docker completion
# generated once via: mkdir -p ~/.zsh/completions && docker completion zsh > ~/.zsh/completions/_docker
fpath=(~/.zsh/completions $fpath)

autoload -Uz compinit && compinit

# aws cli completion
autoload -Uz bashcompinit && bashcompinit
(( $+commands[aws_completer] )) && complete -C aws_completer aws

# fzf shell integration
eval "$(fzf --zsh)"

# zoxide shell integration (used by sesh for smart directory jumping)
eval "$(zoxide init zsh)"

function t() {
  if [ -z "$1" ]; then
    sesh picker
  else
    sesh connect "$1"
  fi
}

if [ -f ~/git/ttam-config/zshrc ]; then
	source ~/git/ttam-config/zshrc
fi

alias vi='nvim'
export PATH=$HOME/bin:$HOME/.local/bin:$PATH
export PIPX_HOME=$HOME/.local/pipx
export EDITOR=nvim
