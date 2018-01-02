# welcome message
cat ~/.bash_welcome

#Define your own aliases here ...
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# convenience variables
export academics="/Users/evan/Academics"
export anvio="/Users/evan/Software/anvio"
export desktop="/Users/evan/Desktop"
export disco="/Users/evan/Software/stunning-disco"
export DESMAN="/Users/evan/Software/DESMAN"
export documents="/Users/evan/Documents"
export illumina="/Users/evan/Software/illumina-utils"
export meren="/Users/evan/Academics/Research/Meren"
export software="/Users/evan/Software"
export saav="/Users/evan/Software/SAAV-structural-mapping"
export aenea="/Users/evan/Software/aenea"
export table2md="csvtomd"
export temp="/Users/evan/Academics/Research/Meren/MATS_NSERC/Synechococcus_DAVEWARD"

# bash prompt
STARTFGCOLOR='\e[0;30m';
STARTBGCOLOR="\e[43m"
ENDCOLOR="\e[0m"
export PS1="\[$STARTFGCOLOR\]\[$STARTBGCOLOR\]\h:[\W]\[$ENDCOLOR\] "

# ls coloring
export CLICOLOR=1
export LSCOLORS=gxhxCxDxBxegedabagaced

# python paths
export PYTHONPATH="${PYTHONPATH}:/Users/evan/Software/pymol-v1.8.6.0-Darwin-x86_64/modules"
export PYTHONPATH="${PYTHONPATH}:/Users/evan/software/stunning-disco"
export PYTHONPATH="${PYTHONPATH}:/Users/evan/Software/SAAV-structural-mapping/saav_structure"

# iterm
test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

# pyenv 
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# embedded matplotlib images
#export MPLBACKEND="module://itermplot"
#export ITERMPLOT=rv

# centrifuge
export CENTRIFUGE_BASE="/Users/evan/Software/CENTRIFUGE"
export PATH=$PATH:$CENTRIFUGE_BASE/centrifuge

# DESMAN
export PATH=$HOME/Users/evan/Software/DESMAN/scripts:$PATH

# copies dotfolder contents into $software/dotfiles. If you get permission denied spam, change
# permission settings here
mkdir -p $software/dotfiles/.ipython && cp -r ~/.ipython/* $software/dotfiles/.ipython
mkdir -p $software/dotfiles/.vim && cp -r ~/.vim/* $software/dotfiles/.vim
rm -rf $software/dotfiles/.vim/bundle/*/.git/