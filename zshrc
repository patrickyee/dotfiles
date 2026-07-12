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

alias vi='nvim'
alias gb='git branch'
alias gco='git checkout'

export CONFIG_DIR=$HOME/.config/lazygit
export HOMEBREW_NO_ENV_HINTS=1
export PATH=$HOME/bin:$HOME/.local/bin:$PATH
export PIPX_HOME=$HOME/.local/pipx
export EDITOR=nvim

if [ -f ~/git/ttam-config/zshrc ]; then
	source ~/git/ttam-config/zshrc
fi

if [ -f ~/.ssh/id_rsa ] && ! ssh-add -l 2>/dev/null |
  grep -qF "$(ssh-keygen -lf ~/.ssh/id_rsa | awk '{print $2}')"; then
  ssh-add ~/.ssh/id_rsa
fi
