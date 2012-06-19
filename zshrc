# OH-MY-ZSH CONFIG
ZSH=$HOME/.oh-my-zsh

ZSH_THEME="pygmalion"

if [ `hostname` = "liza" ]; then
  plugins=(git extract debian vi-mode history-substring-search zsh-syntax-highlighting)
elif [ `hostname` = "milly" ]; then
  plugins=(git extract debian vi-mode history-substring-search zsh-syntax-highlighting)
elif [ `hostname` = "mini.local" ]; then
  plugins=(git extract osx brew vi-mode history-substring-search zsh-syntax-highlighting)
fi

source $ZSH/oh-my-zsh.sh

# PERSONAL CONFIG

zstyle ':completion:*:manuals'    separate-sections true
zstyle ':completion:*:manuals.*'  insert-sections   true
zstyle ':completion:*:man:*'      menu yes select

eval "$(fasd --init auto)"

if [ `hostname` = "liza" ]; then
  export PATH=~/bin:~/perl5/bin:/usr/lib/lightdm/lightdm:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/cuda/bin:~/dotfiles/bin
elif [ `hostname` = "mini.local" ]; then
  export PATH=~/Bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin:~/dotfiles/bin
elif [ `hostname` = "milly" ]; then
  export PATH=~/bin:/usr/lib/lightdm/lightdm:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:~/dotfiles/bin
fi

export EDITOR=vim

export TERM=screen-256color

alias ll=" LC_ALL=en_US.UTF-8 LANG=en ls++ "
alias zshconfig="vim ~/.zshrc"
alias ohmyzsh="vim ~/.oh-my-zsh"
alias tmux="tmux -2"
alias sshhome="ssh -R 19999:localhost:22 arthur@lisnake.dyndns.org"
alias t="~/Dropbox/Bin/todo.txt/todo.sh -tnA -d ~/Dropbox/Bin/todo.txt/todo.cfg"
