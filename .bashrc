PS1='\e[0;32m\u\e[m @ \e[1;32m\h\e[m \e[1;36m\w\e[m $(__git_ps1 "[%s]") \n\$ ' 

source ~/.dotfiles/.git-completion.bash
source ~/.dotfiles/.git-prompt.sh

export GIT_PS1_SHOWDIRTYSTATE=true
export GIT_PS1_SHOWUPSTREAM='auto'
