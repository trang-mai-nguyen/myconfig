#git branch name
function parse_git_branch() {
  git branch 2> /dev/null | sed -n -e 's/^\* \(.*\)/[\1]/p'
}


#EDITOR 
export EDITOR="/opt/homebrew/bin/vim"
export VISUAL="nvim"

#THEME
#Nord
source ~/.zsh/zsh-dircolors-nord/zsh-dircolors-nord.zsh

#PLUG INS
#zsh-autosuggestions
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

# completion
autoload -U compinit
export CLICOLOR=1
compinit

# syntax highlighting
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# vi-mode
# https://github.com/jeffreytse/zsh-vi-mode
source ~/.zsh/zsh-vi-mode/zsh-vi-mode.plugin.zsh 
ZVM_VI_INSERT_ESCAPE_BINDKEY=jk

#set up the prompt (with git branch name)
NEWLINE=$'\n'
setopt PROMPT_SUBST
# PS1='%F{green}%~%f %F{magenta}$(parse_git_branch)${NEWLINE}%B★%b%f '
RPS1="%F{green}%D{%d-%b}%t%f"
#pure
fpath+=($HOME/.zsh/pure)
autoload -U promptinit; promptinit
prompt pure

# makes color constants available
autoload -U colors
colors

# aliases
source ~/.zsh/aliases.zsh

# something asdf?
eval "$(/opt/homebrew/bin/brew shellenv)"
source /Users/jm/.config/broot/launcher/bash/br
source /opt/homebrew/opt/asdf/libexec/asdf.sh

# export PATH="$HOME/.bin:$PATH"
export PATH=/usr/local/sbin:$PATH

# openjdk 
export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"
export CPPFLAGS="-I/opt/homebrew/opt/openjdk/include"

# delete this path below when done learning Nand2Tetris
export PATH=~/Learn/nand2tetris/tools:$PATH
# SML for Programming Languages Part A
export PATH="$PATH:/usr/local/smlnj/bin"
export PATH="$PATH:/Users/jm/.ghcup/env"

[ -f "/Users/jm/.ghcup/env" ] && . "/Users/jm/.ghcup/env" # ghcup-env

. /opt/homebrew/opt/asdf/libexec/asdf.sh

export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES
export DISABLE_SPRING=true
