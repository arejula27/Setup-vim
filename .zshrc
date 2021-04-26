# Lines configured by zsh-newuser-install
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/arejula27/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# alias
alias ls='ls --color=auto'
     #alias dir='dir --color=auto'
     #alias vdir='vdir --color=auto'
 
     alias grep='grep --color=auto'
     alias fgrep='fgrep --color=auto'
     alias egrep='egrep --color=auto'

#some more ls aliases 
   alias ll='ls -alF' 
   alias la='ls -A' 
   alias l='ls -CF' 
   alias goTercero='cd ~/Documentos/Universidad/tercero' 
   
#Prompt

function git_branch_name()
{
  branch=$(git symbolic-ref HEAD 2> /dev/null | awk 'BEGIN{FS="/"} {print $NF}')
  if [[ $branch == "" ]];
  then
    :
  else
    echo '('$branch') '
  fi
}

# Enable substitution in the prompt.
setopt prompt_subst


PROMPT='%(?.%F{green}➜ .%F{red}➜ )%f %B%F{cyan}%1~%f%b %B%F{219}$(git_branch_name)%f%b%# '

#Kubbernetes
   alias k=kubectl 
[[ /usr/sbin/kubectl ]] && source <(kubectl completion zsh)
