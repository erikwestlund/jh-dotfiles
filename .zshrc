# If you come from bash you might have to change your $PATH
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=/Users/erik/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="agnoster"

# Set list of themes to load
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

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
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# Paths
export PATH="$PATH:$HOME/.composer/vendor/bin"
export PATH=$PATH:/Applications/MySQLWorkbench.app/Contents/MacOS


# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

alias lrdb="ssh letsrun-dbserver"
alias lrm="ssh letsrun-master"
alias lrdev="ssh letsrun-dev"

alias art="php artisan"
alias tinker="php artisan tinker"

# git
alias a="git add"
alias ap="git add -p"
alias c="git commit --verbose"
alias ca="git commit -a --verbose"
alias cm="git commit -m"
alias cam="git commit -a -m"
alias m="git commit --amend --verbose"

alias rao="git remote add origin"
alias ac="git add . && git commit -am"

alias pushdev="git push origin dev"
alias pushmaster="git push origin master"
alias pushall="git push --all origin"

alias d="git diff"
alias ds="git diff --stat"
alias dc="git diff --cached"

alias s="git status"
alias sv="git status -v"
alias b="git branch"
alias co="git checkout"
alias cob="git checkout -b"

# coding helpers
alias flredis="redis-cli flushall"
alias log50="tail -n 50 storage/logs/laravel.log"
alias aqw="php artisan queue:work"
alias aql="php artisan queue:listen --tries=3 --timeout=180"
alias phpunit="vendor/bin/phpunit"
alias phpuf="phpunit --filter "
alias duskf="php artisan dusk --filter"
alias code="cd ~/code"
alias clet="cd ~/code/letsrun/"
alias letsrun="cd ~/code/letsrun/"
alias dotfiles="cd ~/code/dotfiles"
alias bootdot="bash ~/code/dotfiles/bootstrap.sh"
alias inrep="sudo ~/System/bin/InsanelyRepairPermission -rt /"
alias d="./develop"
alias dev="./develop"

# blog docker stuff
alias cblog="cd /Users/erik/code/blog"
alias blogstop="cd /Users/erik/code/blog && docker stop blogcontainer"
alias blogrm="cd /Users/erik/code/blog &&  docker rm blogcontainer"
alias blogkill="cd /Users/erik/code/blog && docker stop blogcontainer && docker rm blogcontainer"
alias blogimage="cd /Users/erik/code/blog && docker build -t blog ."
alias blogstart="cd /Users/erik/code/blog && docker run -d --name blogcontainer -p 80:80 -v $(pwd)/app:/app -e FLASK_APP=run.py -e FLASK_DEBUG=1 blog flask run --host=0.0.0.0 --port=80"
alias blogrebuild="cd /Users/erik/code/blog && docker stop blogcontainer && docker rm blogcontainer && docker build -t blog . && docker run -d --name blogcontainer -p 80:80 -v $(pwd)/app:/app -e FLASK_APP=run.py -e FLASK_DEBUG=1 blog flask run --host=0.0.0.0 --port=80"

eval "$(docker-machine env default)"