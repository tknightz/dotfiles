# This is for my WSL
alias folder="explorer.exe"
alias ls="lsd"
# alias less="less -R"

alias copy="xclip -selection clipboard"

# short for git
alias gs="git status"
alias gsh="git stash"
alias gco="git checkout"
alias gcob="git checkout -b"
alias gdbl="git branch -D"
alias gdbr="git push origin --delete"
alias gbr="git branch --format='%(HEAD) %(color:yellow)%(refname:short)%(color:reset) - %(contents:subject) %(color:green)(%(committerdate:relative)) [%(authorname)]' --sort=-committerdate"
alias gl="git log --pretty=format:\"%C(magenta)%h%Creset -%C(red)%d%Creset %s %C(dim green)(%cr) [%an]\" --abbrev-commit -30"
alias ga="git add"

alias gp="git pull origin HEAD"
alias gf="git fetch origin HEAD"

alias gc="git commit --verbose"
alias gca="git commit -a --verbose"
alias gcam="git commit -am"

alias grb="git rebase"
alias gr1="git reset HEAD^"
alias gr2="git reset HEAD^^"
alias grh="git reset --hard"

alias gcp="git cherry-pick"
alias gwt="git worktree"
alias getghtoken="cat ~/.ghtoken | xclip -select clipboard"

function ghelp
  echo '
  gs="git status"
  gsh="git stash"
  gco="git checkout"
  gcob="git checkout -b"
  gdbl="git branch -D"
  gdbr="git push origin --delete"
  gbr="git branch"
  gl="git log"
  ga="git add"

  gp="git pull origin HEAD"
  gf="git fetch origin HEAD"

  gc="git commit --verbose"
  gca="git commit -a --verbose"
  gcam="git commit -am"

  grb="git rebase"
  gr1="git reset HEAD^"
  gr2="git reset HEAD^^"
  grh="git reset --hard"

  gcp="git cherry-pick"
  gwt="git worktree"
  '
end
