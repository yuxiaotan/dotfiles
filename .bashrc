#------------------------------------------////
# Colors:
#------------------------------------------////
BLACK='\[\e[0;30m\]'
BLUE='\[\e[0;34m\]'
GREEN='\[\e[0;32m\]'
CYAN='\[\e[0;36m\]'
RED='\[\e[0;31m\]'
PURPLE='\[\e[0;35m\]'
BROWN='\[\e[0;33m\]'
LIGHTGREY='\[\e[0;37m\]'
DARKGREY='\[\e[1;30m\]'
LIGHTBLUE='\[\e[1;34m\]'
LIGHTGREEN='\[\e[1;32m\]'
LIGHTCYAN='\[\e[1;36m\]'
LIGHTRED='\[\e[1;31m\]'
LIGHTPURPLE='\[\e[1;35m\]'
ORANGE='\[\e[0;33m\]'
YELLOW='\[\e[1;33m\]'
WHITE='\[\e[1;37m\]'
NC='\[\e[0m\]'


#------------------------------------------#
# Pretty Prompt Stuff:
#------------------------------------------#

parse_git_branch () {
    git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ [\1]/'
}

export PS1="\u@\w$ "
##PS1='\[\e[0;31m\]\u\[\e[0m\]@:\[\e[0;34m\]\w\[\e[0m\]\$ '
PS1="${LIGHTBLUE}┌──[${GREEN}\u${LIGHTBLUE}][${ORANGE}\w${LIGHTBLUE}]${GREEN} @\$(parse_git_branch)\r\n${LIGHTBLUE}└──[${CYAN}\$${LIGHTBLUE} ${NC}"

#!/bin/bash
# Term Colors

FGNAMES=('▐▐▐' '▐▐▐' '▐▐▐' '▐▐▐' '▐▐▐' '▐▐▐' '▐▐▐' '▐▐▐')
BGNAMES=('  ')

for b in $(seq 0 0); do
    if [ "$b" -gt 0 ]; then
      bg=$(($b+39))
    fi
#echo -en "\033[0m ${BGNAMES[$b]}"
echo
    for f in $(seq 0 7); do
      echo -en "\033[${bg}m\033[$(($f+30))m ${FGNAMES[$f]} "
      echo -en "\033[${bg}m\033[1;$(($f+30))m ${FGNAMES[$f]} "
    done
echo
  echo -e "\033[0m"
done

#------------------------------------------#
# END PRETTY PROMPT STUFF
#------------------------------------------#

### Loading Files ###
if [ -f ~/.bash_aliases ]; then
. ~/.bash_aliases
fi

if [ -f ~/.bash_functions ]; then
. ~/.bash_functions
fi

# Disable Homebrew Analytics
export HOMEBREW_NO_ANALYTICS=1

