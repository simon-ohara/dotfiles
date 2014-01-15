if [ -f `brew --prefix`/etc/bash_completion.d/git-completion.bash ]; then
. `brew --prefix`/etc/bash_completion.d/git-completion.bash
fi

export CLICOLOR=cons25
export http_proxy="http://lon1.sme.zscaler.net:80"
export https_proxy="http://lon1.sme.zscaler.net:9480"

kill_proxy() {
  export http_proxy=
  export https_proxy=
}

export PATH="/usr/local/bin:/usr/local/sbin:$PATH:~/bin"

# RBENV
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# Rails Fast Testing
export DEFERRED_GARBAGE_COLLECTION=true

# ViM
export EDITOR=vim

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

#File system traversal
alias ..='cd ../'
alias ...='cd ../../'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# system tasks
alias bp='vim ~/.bash_profile &'
alias reset='source ~/.bash_profile; reset'
alias colours='bash ~/bin/bash/colors.sh'
alias clear_stores='find . -name ".DS_Store" -depth -exec rm {} \;'
dev() { cd ~/Development/"$1"; }

# development tasks
alias g="git"
alias b='bundle'
alias bx='b exec'
alias be='bx'
alias rs='bx rspec'
# alias guard='title GUARD ${PWD##*/}; bx guard && wait $!; title Console'
alias fuji_update='b update sop --source sop; bx rake db:drop; bx rake db:create; bx rake db:migrate'

# search functions
alias findme='grep -nir --exclude=\*.svn\* --exclude=\*.swp'
alias whouses='grep -lir --exclude=\*.svn\* --exclude=\*.swp'
alias findfile='find . -iname'
alias inspect='du -csh'

#------------------------------------------------------
# CUSTOM COMMAND PROMPT
#------------------------------------------------------

# COLOUR VARIABLES ------------------------------------
NO_COLOUR='\[\033[0m\]'
FG_BLACK='\[\033[0;30m\]'
FG_RED='\[\033[0;31m\]'
FG_GREEN='\[\033[0;32m\]'
FG_YELLOW='\[\033[0;33m\]'
FG_BLUE='\[\033[0;34m\]'
FG_PURPLE='\[\033[0;35m\]'
FG_TEAL='\[\033[0;36m\]'
FG_WHITE='\[\033[0;37m\]'

BG_BLACK='\[\033[1;40m\]'
BG_RED='\[\033[1;41m\]'
BG_GREEN='\[\033[1;42m\]'
BG_YELLOW='\[\033[1;43m\]'
BG_BLUE='\[\033[1;44m\]'
BG_PURPLE='\[\033[1;45m\]'
BG_TEAL='\[\033[1;46m\]'
BG_WHITE='\[\033[1;47m\]'

PS1_TIME='\[\033[48m\033[38;5;237m\]'
PS1_PATH='\[\033[0;38;5;25m\]'
PS1_MARKER="$FG_YELLOW\$$NO_COLOUR "
GIT_LABEL='\[\033[48;5;235m\033[38;5;242m\]'
GIT_BRANCH='\[\033[48;5;59m\033[38;5;234m\]'
GIT_CLEAN='\[\033[48;5;70m\]'
GIT_DIRTY='\[\033[48;5;88m\]'
GIT_PATH="$FG_TEAL"


function check_user {
  # if user is not root
  if [[ $EUID -ne 0 ]]; then
    PS1_TIME="\[\033[1;48m\033[38;5;237m\] \$(date +%H:%M) "
    PS1_PATH='\[\033[0;38;5;25m\]'
    PS1_MARKER="$FG_YELLOW\$$NO_COLOUR "
  else
    PS1_TIME="\[\033[48;5;52m\033[38;5;161m\] \$(date +%H:%M) \[\033[48;5;88m\033[38;5;17m\] \$(id -nu) "
    PS1_PATH="\[\033[0;38;5;124m\]"
    PS1_MARKER="$FG_YELLOW#$NO_COLOUR "
  fi
}

# Set the title of gnome terminal
function title {
  echo -ne "\033]0;$*\007"
}

# Return the name of the root directory for the current repo
function repo_root {
  d=`pwd`
  while [ "$d" != "" ]; do
    [ -d "$d"/.git ] && echo ${d##*/}
    d=${d%/*}
  done
}

# Check branch status
function get_branch_status {
  if [[ $(git status | tail -n1) != "nothing to commit, working directory clean" ]]; then
    echo -e "$GIT_DIRTY"
  else
    echo -e "$GIT_CLEAN"
  fi
}

# Set the prompt according to which repo the current dir is in - if any
function set_prompt {
  # Set the default prompt
  PS1="$PS1_TIME$PS1_PATH\w$PS1_MARKER"

  # ADD GIT LABELS
  # If git status errors then we are not in a git repo
  # or we do not have git installed so leave prompt as default
  if [[ -z $(git status 2> /dev/null) ]]; then
    return
  fi

  # set repo name to the root dir name
  repo_name=$(repo_root)

  # find the origin file name of remote repo
  remote_repo_file=$(git remote -v | grep origin | tail -1 | cut -f2 -d":" | cut -f1 -d" ")

  # If there is a remote origin use file name to get repo name
  if [[ -n $remote_repo_file ]]; then
    repo_name=$(basename $remote_repo_file) | cut -f1 -d"."
  fi

  # set the title of the terminal to the current repo name
  echo -ne "\033]0;${repo_name}\007"

  # Check if the working branch is clean #253
  #branch_status=$([[ $(git status | tail -n1) != "nothing to commit (working directory clean)" ]] && echo "*")
  branch_status=$(get_branch_status)

  # Get the name of the current branch
  current_branch=$(git branch --no-color | sed -e '/^[^*]/d' -e "s/* \(.*\)/\1/")

  # Set prompt with GIT labels
  PS1="$PS1_TIME$GIT_LABEL $repo_name $GIT_BRANCH ${current_branch} ${branch_status} $GIT_PATH\w$PS1_MARKER"
}

# Output chmod reference diagram and usage
function chmod_ref {
  echo "
        OWNER  GROUP   WORLD
        r w x  r w x   r w x
        1 1 1  1 0 1   1 0 1
          7      5       5
          |______|_______|
                 |
                755
  "

  echo "
 000  001  010  011  100  101  110  111
  0    1    2    3    4    5    6    7
  "

  chmod --help
}

# Chief function to call all / any custom functions
function prompt_command {
  check_user
  set_prompt
}

# Initialisation commands
PROMPT_COMMAND=prompt_command
