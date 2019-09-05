# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

# Powerlevel9k mode requires this to be set *before* the actual theme
POWERLEVEL9K_MODE='awesome-fontconfig'

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="powerlevel9k/powerlevel9k"

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
plugins=(git tmux zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

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

# Include user local bindir to PATH
if [ -d $HOME/.local/bin ]; then
    export PATH=$PATH:$HOME/.local/bin
fi

# Include host-specific configuration if present
if [ -f $HOME/.zshrc.local ]; then
    source $HOME/.zshrc.local
fi

# Append history instead of overwriting
setopt appendhistory

# Sanity check wait before executing a 'rm *'
#setopt RM_STAR_WAIT

# Add colours to common commands
alias ls="ls --color=auto -p --group-directories-first -N"
alias grep="grep --colour=auto --exclude-dir={.bzr,CVS,.git,.hg,.svn}"
alias egrep="egrep --colour=auto"
alias fgrep="fgrep --colour=auto"

# List directories first in zsh completions
zstyle ':completion:*' list-dirs-first true

# Add extra space to fix cut-off icons in terminal emulators that don't handle
# double-width glyphs well (e.g. Konsole)
POWERLEVEL9K_BACKGROUND_JOBS_ICON=$'\uF013 '
POWERLEVEL9K_HOME_ICON=$'\uF015 '
POWERLEVEL9K_HOME_SUB_ICON=$'\uF07C '
POWERLEVEL9K_FOLDER_ICON=$'\uF115 '
POWERLEVEL9K_VCS_UNTRACKED_ICON=$'\uF059 '
POWERLEVEL9K_VCS_UNSTAGED_ICON=$'\uF06A '
POWERLEVEL9K_VCS_STAGED_ICON=$'\uF055 '
POWERLEVEL9K_VCS_STASH_ICON=$'\uF01C '
POWERLEVEL9K_VCS_INCOMING_CHANGES_ICON=$'\uF01A '
POWERLEVEL9K_VCS_OUTGOING_CHANGES_ICON=$'\uF01B '
POWERLEVEL9K_VCS_TAG_ICON=$'\uF217 '
POWERLEVEL9K_VCS_BOOKMARK_ICON=$'\uF27B '
POWERLEVEL9K_VCS_COMMIT_ICON=$'\uF221 '
POWERLEVEL9K_VCS_BRANCH_ICON=$'\uF126 '
POWERLEVEL9K_VCS_REMOTE_BRANCH_ICON=$'\u2192 '
POWERLEVEL9K_VCS_GIT_ICON=$'\uF1D3 '
POWERLEVEL9K_VCS_GIT_GITHUB_ICON=$'\uF113 '
POWERLEVEL9K_VCS_GIT_BITBUCKET_ICON=$'\uF171 '
POWERLEVEL9K_VCS_GIT_GITLAB_ICON=$'\uF296 '
POWERLEVEL9K_LOCK_ICON=$'\UE138 '
POWERLEVEL9K_EXECUTION_TIME_ICON=$'\uF253 '

# Powerlevel9k theme config
POWERLEVEL9K_SHORTEN_DIR_LENGTH=2
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(root_indicator context dir dir_writable vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status command_execution_time background_jobs)

# vim: ft=zsh ts=4 sts=4 sw=4 et
