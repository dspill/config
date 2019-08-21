# vim: set filetype=bash
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ......="cd ../../../../.."

alias ls='ls -v --color="auto"'
alias ll='ls -l'
alias la='ls -A'
alias l='ls -CF'

alias dirs='dirs -v'

alias all_lowercase="perl-rename 'y/A-Z/a-z/'"

alias ttmux='tmux attach -t default || tmux new -s default'

#alias gvim='$HOME/local/bin/gvim --servername VIM'
alias gvim='gvim --servername VIM'
#alias vim='vim --servername VIM'

alias q='exit'
alias c='clear'

alias gaussview='/sw/linux/gaussian/gv/gview'

alias pyrun='mpirun -n $(nproc) python '

#alias wq='watch -d -n 3 qstat'
alias wq='watch -n 3 squeue -u $USER'

alias llqe="llq -l -u dspiller | grep '===== Job Step\|Executable'"

alias wt='watch tail -n 5'

alias cclean='rm -rfv CMakeFiles CMakeCache.txt cmake_install.cmake'

alias light='xrdb -m ~/.xlight && export TERMSTYLE="light"'
alias dark='xrdb -m ~/.xdark && export TERMSYLE="dark"'

alias mathematica='/sw/linux/Mathematica/8.0/scripts/mathematica'

alias dvim="vim -c 'colorscheme default'"

alias matlap="/sw/linux/MATLAB_R2017a/bin/matlab"

alias gcam="git commit -am "

alias jnfo="scontrol show job"
