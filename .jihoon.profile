############################################################################
############################################################################
# jihoon.lee settings
############################################################################
############################################################################

############################################################################
# for command line tools settings
############################################################################

# nodejs
export PATH=$PATH:/usr/local/lib/nodejs/node-v14.15.1-linux-x64/bin

# nvim
[ -f ~/tools/nvim ] && export PATH=$PATH:~/tools

# for vim colorscheme
alias tmux='tmux -2'

# fzf
# --files: List files that would be searched but do not search
# --no-ignore: Do not respect .gitignore, etc...
# --hidden: Search hidden files and folders
# --follow: Follow symlinks
# --glob: Additional conditions for search (in this case ignore everything in the .git/ folder)
#export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!.git/*"'
#export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
export FZF_DEFAULT_COMMAND='fd --type f --no-ignore --hidden --follow --exclude .git'

# for Alacritty
export LANG=en_US.UTF-8

# for git status in sub directories
function gits() {

    current=${PWD}
    echo ${current}

    for test in `fd -HI -t d .git`
    do
        echo ${test}
        #echo ${test%/.git}
        cd ${test%/.git}
        git status
        cd ${current}
    done
}

# for git pull in sub directories
function gitp() {

    current=${PWD}
    echo ${current}

    for test in `fd -HI -t d .git`
    do
        echo ${test}
        #echo ${test%/.git}
        cd ${test%/.git}
        git status
        cd ${current}
    done
}

# zsh
#[ -f /usr/bin/zsh ] && {
#	echo "Type Y to run zsh: "
#	read line
#	[ "$line" = Y ] && {
#		export SHELL=/usr/bin/zsh
#		[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
#		exec /usr/bin/zsh -l
#	}
#}
