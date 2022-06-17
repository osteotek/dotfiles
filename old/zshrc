# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

export ZSH=/Users/arthur/.oh-my-zsh
ZSH_THEME="zeit"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

plugins=(
  git
  vi-mode
  brew
  colored-man-pages
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

export PATH=/Users/arthur/.local/bin:/Users/arthur/go/bin:$PATH

export EDITOR='nvim'

# Compilation flags
export ARCHFLAGS="-arch x86_64"
export BYOBU_PREFIX=/usr/local
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# export SSH_KEY_PATH="~/.ssh/rsa_id"

alias n="nvim"
alias b="battstat"
alias k="exa --long --header --git"
alias l="ls_extended"
alias brwe="brew"
alias cask="brew cask"
alias brewi="brew install"
alias brewf="brew info"
alias brews="brew search"
alias caski="brew cask install"
alias casks="brew cask search"
alias caskf="brew cask info"
alias did="vim +'normal Go' +'r!date' ~/Dropbox/did.txt"

source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/local/share/zsh-history-substring-search/zsh-history-substring-search.zsh
source /Users/arthur/.oh-my-zsh/custom/plugins/enhancd/init.sh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

transfer() { if [ $# -eq 0 ]; then echo -e "No arguments specified. Usage:\necho transfer /tmp/test.md\ncat /tmp/test.md | transfer test.md"; return 1; fi 
tmpfile=$( mktemp -t transferXXX ); if tty -s; then basefile=$(basename "$1" | sed -e 's/[^a-zA-Z0-9._-]/-/g'); curl --progress-bar --upload-file "$1" "https://transfer.sh/$basefile" >> $tmpfile; else curl --progress-bar --upload-file "-" "https://transfer.sh/$1" >> $tmpfile ; fi; cat $tmpfile; rm -f $tmpfile; } 

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

