# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
export LC_ALL=en_US.UTF-8  
export LANG=en_US.UTF-8
export EDITOR=vim
export BLOG=~/DeltaX
export PROMPT="$PROMPT$(git-radar --zsh --fetch) "
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="avit"
# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to disable command auto-correction.
# DISABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)
plugins=(autojump)
source $ZSH/oh-my-zsh.sh

# Autojump
[[ -s $(brew --prefix)/etc/profile.d/autojump.sh ]] && . $(brew --prefix)/etc/profile.d/autojump.sh

# User configuration

# Configure PATH
export PATH="/usr/local/ssl/bin:$PATH"
export PATH="/usr/local/bin:/usr/local/sbin:$PATH"
export PATH="$PATH:/bin"
export PATH="$PATH:/usr/sbinn"
export PATH="$PATH:/sbin"
export PATH="$PATH:/usr/local/smlnj/bin"
export PATH="$PATH:."
export PATH="$PATH:./node_modules/.bin"

# Alias
alias purgeallbuilds='rm -rf ~/Library/Developer/Xcode/DerivedData/*' 
copyToBoard() {
    cat $1 | pbcopy
}
alias pp=copyToBoard
alias ga='git add .'
alias gd='git diff'
alias gam='git add -A && git commit'
alias gamm='git add -A && git commit -m'
autoPush() {
    git add -A
    git commit -m $1
    git push
}
gitFetchAndMerge() {
    git fetch $1
    git merge "$1/$2"
}
gitFetchAndMergeAndPush() {
    git fetch $1
    git merge "$1/$2"
    git push
}
alias gfm=gitFetchAndMerge
alias gfmp=gitFetchAndMergeAndPush
alias g=autoPush
alias gp='git push'
alias gpt='git push --tags'
alias gs='git status'
alias gf='git fetch'
alias gm='git merge'
alias dc="cd /Users/apple/Desktop"
alias ..='cd ..'
alias ...='cd ../..'
alias ....=' cd ../../..'
alias vim='/Applications/MacVim.app/Contents/MacOS/Vim '
alias v='vim'
alias ve='vim -u ~/Desktop/code/essential.vim'
alias v.='vim .'
alias c='clear'
alias rh="runhaskell"
alias cl="rm .*.*.un~ && rm ..*.un~ && rm .*.un~"
alias cx="chmod u+x "
alias p4="proxychains4 "
alias backup="$BLOG/backup.sh "
alias rails5="~/rails/railties/exe/rails"
alias pin="pod install --no-repo-update"
alias julia='/Applications/Julia-0.4.5.app/Contents/Resources/julia/bin/julia'
alias gcid="git log | head -1 | awk '{print substr(\$2,1,7)}' | pbcopy"
alias git 
eval $(thefuck --alias)


# SSH
SSH_ENV=$HOME/.ssh/environment
   
# start the ssh-agent
function start_agent {
    echo "Initializing new SSH agent..."
    # spawn ssh-agent
    /usr/bin/ssh-agent | sed 's/^echo/#echo/' > "${SSH_ENV}"
    echo succeeded
    chmod 600 "${SSH_ENV}"
    . "${SSH_ENV}" > /dev/null
    /usr/bin/ssh-add
}
   
if [ -f "${SSH_ENV}" ]; then
     . "${SSH_ENV}" > /dev/null
     ps -ef | grep ${SSH_AGENT_PID} | grep ssh-agent$ > /dev/null || {
        start_agent;
    }
else
    start_agent;
fi

# Highlight
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/local/opt/zsh-history-substring-search/zsh-history-substring-search.zsh
function gi() { curl -L -s https://www.gitignore.io/api/$@ ;}

# pyenv
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi

# added by travis gem
[ -f /Users/apple/.travis/travis.sh ] && source /Users/apple/.travis/travis.sh

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
