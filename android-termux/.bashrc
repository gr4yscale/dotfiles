#prompt
export PS1="\w>"

export GOPATH=$HOME/go
export GOBIN=$HOME/go/bin

export PATH="$PATH:$GOBIN"

# for tmux to get its colors right (hopefully)
export TERM=xterm-256color

export BROWSER=termux-open-url

alias org-push="rclone copy --stats 500ms --stats-log-level NOTICE ~/org dropbox:/org"
alias org-pull="rclone copy --stats 500ms --stats-log-level NOTICE dropbox:/org ~/org"

#alias drop-push="rclone copy --stats 500ms --stats-log-level NOTICE $0 dropbox:/$1"

drop-push() {
    rclone copy --stats 500ms --stats-log-level NOTICE "$1" "dropbox:/$2"
}

drop-pull() {
    rclone copy --stats 500ms --stats-log-level NOTICE "dropbox:/$1" "$2"
}
