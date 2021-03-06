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
alias nvim='NVIM_LISTEN_ADDRESS=/tmp/nvimsocket nvim'
alias vim='NVIM_LISTEN_ADDRESS=/tmp/nvimsocket nvim'

alias q='exit'
alias c='clear'

alias gaussview='/sw/linux/gaussian/gv/gview'

alias pyrun='mpirun -n $(nproc) python '

#alias wq='watch -d -n 3 qstat'
alias wq='watch -n 3 squeue -u $USER'

alias llqe="llq -l -u $USER | grep '===== Job Step\|Executable'"

alias wt='watch tail -n 5'

alias cclean='rm -rfv CMakeFiles CMakeCache.txt cmake_install.cmake'

alias light='xrdb -m ~/.xlight && export TERMSTYLE="light"'
alias dark='xrdb -m ~/.xdark && export TERMSYLE="dark"'

if [ -x '/sw/linux/Mathematica/11.2/scripts/mathematica' ]; then
    alias mathematica='/sw/linux/Mathematica/11.2/scripts/mathematica'
fi

alias dvim="vim -c 'colorscheme default'"

alias matlap="/sw/linux/MATLAB_R2017a/bin/matlab"

alias gcam="git commit -am "

alias gcamup="git commit -am 'update' && git push"

alias jnfo="scontrol show job"

if [ -x "~/scripts/print_scratch.sh" ]; then
    alias scratch="PYTHONPATH= cd $(~/scripts/print_scratch.sh)"
fi


alias delete_content_of_cwd="perl -e 'for(<*>){((stat)[9]<(unlink))}'"

alias plot="plot.py -f "

alias trim="ex +'bufdo!%s/\s\+$//e' -scxa"
alias retab="ex +'set ts=2' +'bufdo retab' -scxa"

alias thesis="nohup zotero & cd ~/pckr166/thesis \
    && NVIM_LISTEN_ADDRESS=/tmp/nvimsocket nvim -c VimtexCompile thesis.tex"

alias spotify="spotify --no-zygote"
