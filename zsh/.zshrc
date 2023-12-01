# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

# Powerlevel10k mode requires this to be set *before* the actual theme
POWERLEVEL9K_MODE='fontconfig'

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

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

# zsh-completions plugin should be added to $fpath and before oh-my-zsh.sh is
# sourced instead of being added to $plugins.
# For details see: https://github.com/zsh-users/zsh-completions/issues/603
if [ -d ${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions ]; then
    fpath+=${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions/src
fi

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

# Append history instead of overwriting
setopt appendhistory

# Sanity check wait before executing a 'rm *'
#setopt RM_STAR_WAIT

# Add colours to common commands
MACOS_USE_GNU_COREUTILS=1
if [[ $OSTYPE == 'darwin'* && $MACOS_USE_GNU_COREUTILS ]]; then
    alias ls="gls --color=auto -vpN --group-directories-first"
elif [[ $OSTYPE != 'darwin'* ]]; then
    alias ls="ls --color=auto -vpN --group-directories-first"
    alias grep="grep --colour=auto --exclude-dir={.bzr,CVS,.git,.hg,.svn}"
    alias egrep="egrep --colour=auto"
    alias fgrep="fgrep --colour=auto"
fi

# List directories first in zsh completions
zstyle ':completion:*' list-dirs-first true

#
# Include user local bindir to PATH
#
if [ -d $HOME/.local/bin ]; then
    export PATH=$PATH:$HOME/.local/bin
fi

#
# Include host-specific configuration if present
#
if [ -f $HOME/.zshrc.local ]; then
    source $HOME/.zshrc.local
fi

#
# Powerlevel10k theme config
#
typeset -g POWERLEVEL9K_SHORTEN_DIR_LENGTH=2
typeset -g POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(
    root_indicator
    context
    anaconda
    pyenv
    virtualenv
    dir
    dir_writable
    vcs
)
typeset -g POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(
    status
    command_execution_time
    background_jobs
)

# vim: ft=zsh ts=4 sts=4 sw=4 tw=100 et
