# OH-MY-ZSH CONFIG
export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="miloshadzic"

plugins=(git go extract osx brew fasd vundle history-substring-search pip pyenv pylint python vagrant virtualenv virtualenvwrapper zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# PERSONAL CONFIG

zstyle ':completion:*:manuals'    separate-sections true
zstyle ':completion:*:manuals.*'  insert-sections   true
zstyle ':completion:*:man:*'      menu yes select

export PATH=/usr/local/cuda/bin:/Library/TeX/texbin:/usr/local/sbin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin
export DYLD_FALLBACK_LIBRARY_PATH=/usr/local/cuda/lib/:$DYLD_FALLBACK_LIBRARY_PATH

export EDITOR=vim
export TERM=xterm-256color
export BYOBU_PREFIX=$(brew --prefix)
export MP_FULLNAME="Arthur Tazhitdinov"
export SONAR_RUNNER_HOME=/usr/local/Cellar/sonar-runner/2.5/libexec
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
#export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python3
#export ARCHFLAGS="-arch x86_64"
fpath=(/usr/local/share/zsh-completions $fpath)

alias zshconfig="vim ~/.zshrc"
alias vimconfig="vim ~/.vimrc"
alias ohmyzsh="vim ~/.oh-my-zsh"
#alias tmux="tmux -2"
alias sshhome="ssh -p 2222 arthur@467859.dyn.ufanet.ru"
alias t="~/Dropbox/Bin/todo.txt-cli/todo.sh -tnA -d ~/Dropbox/Bin/todo.txt-cli/todo.cfg"
alias zshreload="source ~/.zshrc"
alias speed="speedtest-cli --mini http://v.ufanet.ru/"
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
#source /usr/local/bin/virtualenvwrapper.sh

test -e ${HOME}/.iterm2_shell_integration.zsh && source ${HOME}/.iterm2_shell_integration.zsh
