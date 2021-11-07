# source "$HOME/.vim/plugged/gruvbox/gruvbox_256palette.sh"
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

export PATH=/home/cristo/.local/lib/python3.8/site-packages:$PATH

# GO
# export GOROOT=/usr/lib/go
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$HOME/.local/bin

eval "$(starship init zsh)"
# Path to your oh-my-zsh installation.
export ZSH="/home/cristo/.oh-my-zsh"
# export PATH="/home/cristo/.gem/ruby/2.7.0/bin:$PATH"
export VISUAL="/usr/local/bin/nvim"
export EDITOR="$VISUAL"
# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="robbyrussell"
# ZSH_THEME="spaceship"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

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
plugins=(
  git
  battery
  you-should-use
  zsh-autosuggestions
)
source $ZSH/oh-my-zsh.sh
RPROMPT='$(battery_pct_prompt) ...'
bindkey '^ ' autosuggest-accept
autoload -Uz compinit && compinit

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
alias ssh="kitty +kitten ssh"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_OPTS='--bind ctrl-y:preview-up,ctrl-e:preview-down'
if [ -x "$(command -v rg)" ]; then
export FZF_DEFAULT_COMMAND='rg --hidden --no-ignore --files'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
fi
export FZF_ALT_C_COMMAND="ls -d .*/* */*"
export FZF_CTRL_T_OPTS="--preview 'bat --color=always --line-range :100 {}' --bind='F2:toggle-preview'"

alias update='sudo apt-get update && sudo apt-get upgrade && sudo apt-get dist-upgrade'

#alias for git
alias gcl='git clone'
alias ga='git add'
alias grm='git rm'
alias grmc='git rm --cached'
alias gap='git add -p'
alias gall='git add -A'
alias gf='git fetch --all --prune'
alias gft='git fetch --all --prune --tags'
alias gfv='git fetch --all --prune --verbose'
alias gftv='git fetch --all --prune --tags --verbose'
alias gus='git reset HEAD'
alias gpristine='git reset --hard && git clean -dfx'
alias gclean='git clean -fd'
alias gm="git merge"
alias gmv='git mv'
alias g='git'
alias get='git'
alias gs='git status'
alias gss='git status -s'
alias gsu='git submodule update --init --recursive'
alias gl='git pull'
alias glum='git pull upstream master'
alias gpr='git pull --rebase'
alias gpp='git pull && git push'
alias gup='git fetch && git rebase'
alias gp='git push'
alias gpo='git push origin HEAD'
alias gpu='git push --set-upstream'
alias gpuo='git push --set-upstream origin'
alias gpuoc='git push --set-upstream origin $(git symbolic-ref --short HEAD)'
alias gpom='git push origin master'
alias gr='git remote'
alias grv='git remote -v'
alias gra='git remote add'
alias gd='git diff'
alias gds='git diff --staged'
alias gdvim='git difftool'
alias gdsvim='git difftool --staged'
alias gdv='git diff -w "$@" | vim -R -'
alias gc='git commit -v'
alias gca='git commit -v -a'
alias gcm='git commit -v -m'
alias gcam="git commit -v -am"
alias gci='git commit --interactive'
alias gcamd='git commit --amend'
alias gb='git branch'
alias gba='git branch -a'
alias gbt='git branch --track'
alias gbm='git branch -m'
alias gbd='git branch -d'
alias gbD='git branch -D'
alias gcount='git shortlog -sn'
alias gcp='git cherry-pick'
alias gcpx='git cherry-pick -x'
alias gco='git checkout'
alias gcom='git checkout master'
alias gcb='git checkout -b'
alias gcob='git checkout -b'
alias gct='git checkout --track'
alias gcpd='git checkout master; git pull; git branch -D'
alias gexport='git archive --format zip --output'
alias gdel='git branch -D'
alias gmu='git fetch origin -v; git fetch upstream -v; git merge upstream/master'
alias gll='git log --graph --pretty=oneline --abbrev-commit'
alias gg="git log --graph --all --pretty=format:'%C(bold)%h%Creset%C(magenta)%d%Creset %s %C(yellow)<%an> %C(cyan)(%cr)%Creset' --abbrev-commit --date=relative"
alias ggs="gg --stat"
alias gsl="git shortlog -sn"
alias gwc="git whatchanged"
alias gt="git tag"
alias gta="git tag -a"
alias gtd="git tag -d"
alias gtl="git tag -l"
alias gpatch="git format-patch -1"
# From http://blogs.atlassian.com/2014/10/advanced-git-aliases/
# Show commits since last pull
alias gnew="git log HEAD@{1}..HEAD@{0}"
# Add uncommitted and unstaged changes to the last commit
alias gcaa="git commit -a --amend -C HEAD"
# Rebase with latest remote master
alias gprom="git fetch origin master && git rebase origin/master && git update-ref refs/heads/master origin/master"
alias gpunch="git push --force-with-lease"
alias ggui="git gui"
alias gcsam="git commit -S -am"
alias gst="git stash"
alias gstb="git stash branch"
alias gstd="git stash drop"
alias gstl="git stash list"
alias gstp="git stash pop"
# alias gh='cd "$(git rev-parse --show-toplevel)"'
# Show untracked files
alias gu='git ls-files . --exclude-standard --others'

alias gbrow="hub browse"
alias nvide="$HOME/neovide/target/release/neovide"

alias icat="kitty kitten icat"
# Thefuck
eval $(thefuck --alias)
stty -ixon

# You must configure difftool
# git config --global diff.tool vimdiff
# git config --global difftool.prompt false
# (https://medium.com/@GroundControl/better-git-diffs-with-fzf-89083739a9cb)
getdiff()
{
  if [ -d .git ]; then
    preview="git diff $@ --color=always -- {-1}"
    execute="enter:execute(git difftool {} < /dev/tty)"
    git diff $@ --name-only | fzf -m --ansi --bind $execute \
                --preview $preview
  else
    echo "It's not a git repository"
  fi;
}
. "/home/cristo/.local/share/lscolors.sh"
export PATH=$PATH:/usr/local/go/bin
export GEM_HOME="$HOME/.gem"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

alias buildPVS="pvs-studio-analyzer analyze -l ~/.config/PVS-Studio/PVS-Studio.lic -o ./project.log -e build && plog-converter -a GA:1,2 -t tasklist -o report.tasks project.log"

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
# Install Ruby Gems to ~/gems
export GEM_HOME="$HOME/gems"
export PATH="$HOME/gems/bin:$PATH"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/cristo/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/cristo/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/cristo/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/cristo/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

alias luamake=/home/cristo/.config/nvim/lua-language-server/3rd/luamake/luamake
