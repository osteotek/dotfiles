# OH-MY-ZSH CONFIG
ZSH=$HOME/.oh-my-zsh

ZSH_THEME="pygmalion"

if [ `hostname` = "liza" ]; then
  plugins=(git autojump extract debian zsh-syntax-highlighting)
elif [ `hostname` = "milly" ]; then
  plugins=(git autojump extract debian zsh-syntax-highlighting)
elif [ `hostname` = "mini.local" ]; then
  plugins=(git autojump extract osx brew zsh-syntax-highlighting)
fi

source $ZSH/oh-my-zsh.sh

# PERSONAL CONFIG
if [ `hostname` = "liza" ]; then
  export PATH=~/bin:~/perl5/bin:/usr/lib/lightdm/lightdm:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/cuda/bin:~/Dropbox/Bin
  export PERL_LOCAL_LIB_ROOT="/home/arthur/perl5";
  export PERL_MB_OPT="--install_base /home/arthur/perl5";
  export PERL_MM_OPT="INSTALL_BASE=/home/arthur/perl5";
  export PERL5LIB="/home/arthur/perl5/lib/perl5/x86_64-linux-gnu-thread-multi:/home/arthur/perl5/lib/perl5";
elif [ `hostname` = "mini.local" ]; then
  export PATH=~/Bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin:~/Dropbox/Bin
elif [ `hostname` = "milly" ]; then
  export PATH=~/bin:/usr/lib/lightdm/lightdm:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:~/Dropbox/Bin
fi

export EDITOR=vim

export TERM=screen-256color

alias ll=" LC_ALL=en_US.UTF-8 LANG=en ls++ "
alias zshconfig="vim ~/.zshrc"
alias ohmyzsh="vim ~/.oh-my-zsh"
alias tmux="tmux -2"
alias sshhome="ssh -R 19999:localhost:22 arthur@lisnake.dyndns.org"
alias t="~/Dropbox/Bin/todo.txt/todo.sh -tnA -d ~/Dropbox/Bin/todo.txt/todo.cfg"
