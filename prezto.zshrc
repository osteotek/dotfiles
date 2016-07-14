#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...

export GOPATH=$HOME/projects/go
export HOMEBREW_GITHUB_API_TOKEN="b9d66b79be21463eed1b679b2712fc9cdad339cc"
export PATH=/usr/local/cuda/bin:~/bin:$PATH
export VISUAL=vim
export EDITOR="$VISUAL"

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
