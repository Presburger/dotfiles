source ~/.zplug/init.zsh
# Make sure to use double quotes
zplug "zsh-users/zsh-completions"            
zplug "zsh-users/zsh-autosuggestions"        
zplug "zsh-users/zsh-syntax-highlighting"    
zplug "zsh-users/zsh-history-substring-search"

# Disable updates using the "frozen" tag
zplug "k4rthik/git-cal", as:command, frozen:1

zplug "plugins/git",   from:oh-my-zsh

# Load theme file
zplug "themes/ys",   from:oh-my-zsh, as:theme

zplug "junegunn/fzf"
zplug "junegunn/fzf-bin", \
    from:gh-r, \
    as:command, \
    rename-to:fzf, \
    use:"*linux*amd64*"

source $ZPLUG_HOME/repos/junegunn/fzf/shell/completion.zsh
source $ZPLUG_HOME/repos/junegunn/fzf/shell/key-bindings.zsh

zplug "zpm-zsh/ls"


if zplug check b4b4r07/enhancd; then
    export ENHANCD_FILTER=fzf-tmux
fi

if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

zplug load

setopt AUTO_CD
setopt AUTO_PUSHD
setopt PUSHD_IGNORE_DUPS
setopt PUSHD_SILENT
setopt PUSHD_TO_HOME
setopt EXTENDED_GLOB
HISTFILE=~/.zsh_history
setopt SHARE_HISTORY
HISTSIZE=10000
SAVEHIST=10000
setopt HIST_FIND_NO_DUPS
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_VERIFY
setopt INTERACTIVE_COMMENTS
setopt NO_CLOBBER
setopt AUTO_RESUME
setopt LONG_LIST_JOBS
setopt NO_BG_NICE
setopt NO_CHECK_JOBS
setopt NO_HUP
setopt no_nomatch
export GPG_TTY=$(tty)

###############USR ENV#############
export GIT_LFS_SKIP_SMUDGE=1
export PATH=~/.local/bin:$PATH

[[ -s /home/yushengma/.autojump/etc/profile.d/autojump.sh ]] && source /home/yushengma/.autojump/etc/profile.d/autojump.sh
