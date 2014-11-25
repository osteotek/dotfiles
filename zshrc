# OH-MY-ZSH CONFIG
ZSH=$HOME/.oh-my-zsh

ZSH_THEME="terminalparty"

if [ `uname` = "Linux" ]; then
  plugins=(git extract debian vundle fasd history-substring-search zsh-syntax-highlighting)
elif [ `uname` = "Darwin" ]; then
  plugins=(git extract osx brew fasd vundle history-substring-search zsh-syntax-highlighting)
fi

source $ZSH/oh-my-zsh.sh

# PERSONAL CONFIG

zstyle ':completion:*:manuals'    separate-sections true
zstyle ':completion:*:manuals.*'  insert-sections   true
zstyle ':completion:*:man:*'      menu yes select

if [ `hostname` = "mini" ]; then
  export PATH=/usr/local/sbin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin:~/dotfiles/bin:~/Dropbox/bin:/Applications/Android\ Studio.app/sdk/platform-tools:$PATH
  export BYOBU_PREFIX=$(brew --prefix)
elif [ `hostname` = "retina.local" ]; then
  export PATH=/Developer/NVIDIA/CUDA-6.5/bin:/usr/local/sbin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin
  export ANDROID_HOME=/usr/local/opt/android-sdk
  #export DYLD_LIBRARY_PATH=/Developer/NVIDIA/CUDA-6.0/lib:$DYLD_LIBRARY_PATH
elif [ `uname` = "Linux" ]; then
  export PATH=/usr/lib/lightdm/lightdm:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:~/dotfiles/bin
fi

export EDITOR=vim
export TERM=xterm-256color
#export ARCHFLAGS="-arch x86_64"
fpath=(/usr/local/share/zsh-completions $fpath)

alias ll=" LC_ALL=en_US.UTF-8 LANG=en ls++ "
alias zshconfig="vim ~/.zshrc"
alias vimconfig="vim ~/.vimrc"
alias ohmyzsh="vim ~/.oh-my-zsh"
#alias tmux="tmux -2"
alias sshhome="ssh arthur@lisnake.no-ip.org"
alias t="~/Dropbox/Bin/todo.txt/todo.sh -tnA -d ~/Dropbox/Bin/todo.txt/todo.cfg"
alias zshreload="source ~/.zshrc"
alias speed="speedtest-cli --mini http://v.ufanet.ru/"
#export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
