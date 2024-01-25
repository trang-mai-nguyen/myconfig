#git branch name
function parse_git_branch() {
  git branch 2> /dev/null | sed -n -e 's/^\* \(.*\)/[\1]/p'
}

#set up the prompt (with git branch name)
NEWLINE=$'\n'
setopt PROMPT_SUBST
PS1='%F{green}%~%f %F{magenta}$(parse_git_branch)${NEWLINE}%B★%b%f '
RPS1="%F{green}%D{%d-%b}%t%f"

#EDITOR 
export EDITOR="/opt/homebrew/bin/vim"
export VISUAL="$EDITOR"

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
# export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"

# delete this path below when done learning Nand2Tetris
export PATH=~/Learn/nand2tetris/tools:$PATH
# SML for Programming Languages Part A
export PATH="$PATH:/usr/local/smlnj/bin"
