# Git hf aliases
alias gu='git hf update'
alias gfs='gu && git hf feature start'
alias gff='git hf feature finish'
alias gp='git hf push'
alias ghs='git hf hotfix start'
alias ghf='git hf hotfix finish'

# Git aliases
alias g='git'
alias gs='git stash -u'
alias gsp='git stash pop'
alias gca='git commit --amend --no-edit'

alias fzf-branch='git branch | grep -v "$(git branch --show-current)" | fzf-tmux -d 15' # fuzzy find branches except current branch
alias gco='git checkout $(fzf-branch)' # git checkout branch
alias gdb='git branch -D $(fzf-branch)' # git delete branch
alias gfp='git push -u origin "$(git branch --show-current)" --force' # force push current branch
alias gmf='git merge --log --ff-only $(fzf-branch)' # merge selected branch into current branch

# overmind
alias o='overmind'
alias os='overmind start'
alias oca='overmind connect api'
alias or='overmind restart'
alias ora='overmind restart api'

# Ship git aliases
alias sg="shipgit"
alias sgu="shipgit update"
alias sgf="shipgit feature"
alias sgr="shipgit release"
alias sgh="shipgit hotfix"

# Nvim
alias nv='nvim'

# Rails
alias rc='rails console'

# Tmuxinator
alias tapir='tmuxinator start postco'
alias renew='tmuxinator start renew'
alias tickets='tmuxinator start tickets'

# Source the config file
alias scr="source ~/.zshrc"
