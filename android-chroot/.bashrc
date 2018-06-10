#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

#env
export LANGUAGE=en_US.UTF-8
export LANG=en_US.UTF-8
export LC_TYPE=en_US.UTF-8


###### unlimited history
export HISTFILESIZE=
export HISTSIZE=
export HISTTIMEFORMAT="[%F %T] "


# Set up Node Version Manager (slows down launching a terminal, i just source this manually)
alias nvm-init='source /usr/share/nvm/init-nvm.sh'


#export PATH="/opt/fakeroot/bin/:${PATH}"

export PATH="$PATH:$HOME/go/bin"


alias push-org="rclone copy --stats 500ms --stats-log-level NOTICE ~/org dropbox:/org"
alias pull-org="rclone copy --stats 500ms --stats-log-level NOTICE dropbox:/org ~/org"

#alias drop-push="rclone copy --stats 500ms --stats-log-level NOTICE $0 dropbox:/$1"

drop-push() {
    rclone copy --stats 500ms --stats-log-level NOTICE "$1" "dropbox:/$2"
}

drop-pull() {
    rclone copy --stats 500ms --stats-log-level NOTICE "dropbox:/$1" "$2"
}


alias pocket='pockyt put -i '
alias pinboard='pin add '


#youtube-dl (vid)
alias yt-vid="youtube-dl -f 'bestvideo[ext=mp4]+bestaudio[ext=m4a]/best[ext=mp4]/best' -w -i"
alias yt-aud="youtube-dl -x --audio-format best --audio-quality 320k --audio-format mp3 --embed-thumbnail -w -i -o '%(title)s.%(ext)s'"



# web scraping
alias web-scrape="wget --recursive --no-clobber --html-extension --page-requisites --convert-links "

alias pull-sync-dir="rsync -avz --progress -e 'ssh -p 39909' gr4yscale@gr4yscale.duckdns.org:/to-sync . "
