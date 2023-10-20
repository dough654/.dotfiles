# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/doug/.oh-my-zsh"
# Load some env variables from my .env file
# This keeps secrets out of my .dotfiles repo
set -o allexport; source ~/.env; set +o allexport
# Set name of the theme to load --- if set to "random", it will

# Set up ocaml opam init so tools are available in path
eval `opam config env`

# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

function start-ticket {
	node ~/dev/lc/setup/start-ticket.js "$@"
}

function open-ticket {
	node ~/dev/lc/setup/open-ticket.js "$@"
}

function aws-role {
	aws-vault exec "$@" --no-session
}

function aws-login {
	aws sso login --profile rbi.ctg
}

function aws-dev {
	aws-assume-role rbi.dev.admin
}

function aws-go {
	aws-login && aws-dev
}

function weather {
	curl http://wttr.in
}

function die {
	killall -s KILL "$@"
}

function port {
	lsof -i ":$@"
}

function dev-session {
	sh ~/.dotfiles/scripts/dev-session-no-nvim.sh $(pwd)
}

function dev {
	sh ~/.dotfiles/scripts/dev-session-nvim.sh $(pwd)
}

function tmuxs {
	if tmux attach-session -d -t "scratch"; then
        	echo "Attached to existing session"
	else
		echo "Creating new session called scratch"
		tmux new -s "scratch" -d
	fi
	
}

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

ZSH_THEME="af-magic"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# Caution: this setting can cause issues with multiline prompts (zsh 5.7.1 and newer seem to work)
# See https://github.com/ohmyzsh/ohmyzsh/issues/5765
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
#plugins=(git)

source $ZSH/oh-my-zsh.sh
source $HOME/zsh-plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source $HOME/zsh-plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $HOME/zsh-plugins/zsh-vim-mode/zsh-vim-mode.plugin.zsh

# User configuration

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

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
#
#
bindkey -v
plugins=(
	git
	zsh-autosuggestions
	zsh-syntax-highlighting
	zsh-vim-mode
	)

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[[ -f /home/doug/dev/test/backend/node_modules/tabtab/.completions/serverless.zsh ]] && . /home/doug/dev/test/backend/node_modules/tabtab/.completions/serverless.zsh
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[[ -f /home/doug/dev/test/backend/node_modules/tabtab/.completions/sls.zsh ]] && . /home/doug/dev/test/backend/node_modules/tabtab/.completions/sls.zsh
# tabtab source for slss package
# uninstall by removing these lines or running `tabtab uninstall slss`
[[ -f /home/doug/dev/test/backend/node_modules/tabtab/.completions/slss.zsh ]] && . /home/doug/dev/test/backend/node_modules/tabtab/.completions/slss.zsh
export PATH="/home/linuxbrew/.linuxbrew/opt/openjdk@8/bin:$PATH"

# RBI AWS SSO Helpers
export PATH=${PATH}:/home/doug/dev/rbi/ctg-devops/scripts/aws-sso
source /home/doug/dev/rbi/ctg-devops/scripts/aws-sso/aws-functions


# RBI AWS SSO Helpers
export PATH=${PATH}:/home/doug/dev/rbi/test/ctg-devops/scripts/aws-sso
source /home/doug/dev/rbi/test/ctg-devops/scripts/aws-sso/aws-functions

# Homebrew
export PATH=${PATH}:/home/linuxbrew/.linuxbrew/bin:/home/doug/.local/bin

#Golang
export PATH=$PATH:/usr/local/go/bin
export GOBIN=/home/doug/.go/bin
export PATH=$PATH:$GOBIN
export PATH=$PATH:/home/doug/.dotnet
export PATH=$PATH:/home/doug/.dotnet/tools

# Turso
export PATH="/home/doug/.turso:$PATH"

[ -f "/home/doug/.ghcup/env" ] && source "/home/doug/.ghcup/env" # ghcup-env

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/doug/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/doug/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/doug/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/doug/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<


