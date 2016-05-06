for file in ~/.{extra,bash_prompt,exports,aliases,functions}; do
	[ -r "$file" ] && source "$file"
done
unset file

# Aliases
alias dockerc=docker-compose
alias dockerm=docker-machine

# Path
export PATH=$PATH:$HOME/bin

# Git
. $HOME/.git-completion.bash
. $HOME/.git-prompt.sh
export GIT_PS1_SHOWDIRTYSTATE=1
export GIT_PS1_SHOWUNTRACKEDFILES=1
export GIT_PS1_SHOWCOLORHINTS=1
#PS1='[\u@\h \W$(__git_ps1 " (%s)")]\$ '
PROMPT_COMMAND='__git_ps1 "\u@\h:\W" "\\\$ "'

# Go
export GOPATH=$HOME/Developer/go
export PATH=$PATH:$GOPATH/bin

# virtualenvwrapper
export WORKON_HOME=$HOME/.virtualenvs
source /usr/local/bin/virtualenvwrapper.sh

# Load RVM into a shell session *as a function*
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" 
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

##
## better `cd`'ing
##

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob;

# Autocorrect typos in path names when using `cd`
shopt -s cdspell;
