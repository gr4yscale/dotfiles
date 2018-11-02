#
# ~/.bashrc
#


# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# enable ** pattern used in pathname expansion context
# ls **/*.py

shopt -s globstar

# nice prompt
PS1='[\u@\h \W]\$ '

# add scripts directory to path
PATH=~/scripts:$PATH

# ls colors
alias ls='ls --color=auto'

# TODO readline tweaks?

export EDITOR=vim
#fix emacs colors in tmux
export TERM=xterm-256color

###### HISTORY
shopt -s histappend 
export HISTFILESIZE=
export HISTSIZE=
export HISTTIMEFORMAT="[%F %T] "

# dont let ranger load the default config
RANGER_LOAD_DEFAULT_RC=false

# Set up fzf
#[ -f ~/.fzf.bash ] && source ~/.fzf.bash


# node / nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" --no-use  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


# machines
alias archbeast-internal='ssh -p 39909 gr4yscale@192.168.0.11'
alias databox-internal='ssh gr4yscale@192.168.0.14'
alias archbeast="mosh --ssh='ssh -p 39909' -p 40045 gr4yscale@gr4yscale.duckdns.org"
alias archbeast-ext="ssh -p 39909 gr4yscale@gr4yscale.duckdns.org"

###### chromium app aliases
alias devdocs='chromium --app="https://devdocs.io/" --new-window &'
alias gmail='chromium  --app=https://mail.google.com/mail/u/0/#starred'
alias gcal='chromium --app="https://calendar.google.com" --new-window &'
alias simplenote='chromium --app="https://app.simplenote.com" --new-window &'
alias messenger='chromium  --app=https://www.messenger.com'
alias whatsapp='chromium --app=https://web.whatsapp.com'
alias mopidy='chromium --app=http://192.168.0.14:6680/musicbox_webclient/'
alias passthroughpost='chromium --app=https://discordapp.com/channels/385116113933172736/391008247282270208 --new-window &'

#youtube-dl (vid)
alias yt-vid="youtube-dl -ciw -f 'bestvideo[ext=mp4]+bestaudio[ext=m4a]/best[ext=mp4]/best' "
alias yt-playlist="youtube-dl -ciw -f 'bestvideo[ext=mp4]+bestaudio[ext=m4a]/best[ext=mp4]/best' -o '%(playlist)s/%(playlist_index)s - %(title)s.%(ext)s'"
alias yt-aud="youtube-dl -ciw -x --audio-format best --audio-quality 320k --audio-format mp3 --embed-thumbnail -o '%(title)s.%(ext)s'"
alias yt-music="cd ~/storage/audio/music/organize; yt-aud"


# handy shortcuts
function ranger-cd {
    tempfile="$(mktemp -t tmp.XXXXXX)"
    ranger --choosedir="$tempfile" "${@:-$(pwd)}"
    test -f "$tempfile" &&
    if [ "$(cat -- "$tempfile")" != "$(echo -n `pwd`)" ]; then
        cd -- "$(cat "$tempfile")"
    fi
    rm -f -- "$tempfile"
}

alias a=archbeast-internal
alias r='ranger-cd'
alias w='sudo wifi-menu'
alias t='tmux'
alias ta='tmux a'
alias bb='i3lock -c 101010 -u && systemctl suspend'
alias lock='i3lock -c 101010 -u'
alias bm='sudo bashmount.sh'
alias v='vim'


alias wanip='dig +short myip.opendns.com @resolver1.opendns.com'
#alias hot_connect='sudo netctl start hotspot'
#alias hot_disconnect='sudo netctl stop hotspot; sudo ip link set wlan0 down'

# VM RDP access
alias windoze-floating='rdesktop -g 1920x1080 -P -z -x l -r sound:remote -0 -u gr4yscale -p p@ssw0rd 192.168.0.15'
alias windoze-full="i3-msg 'workspace 10:extra'; rdesktop -g 1920x1050 -P -z -x l -r sound:remote -0 -u gr4yscale -p p@ssw0rd 192.168.0.15; i3-msg 'floating disable'"


alias scrape='wget --recursive --no-clobber --page-requisites --html-extension --convert-links --restrict-file-names=windows --no-parent '

alias radio-listen='mpv --msg-level=ao/sndio=no --script /usr/lib/mpv/mpris.so http://gr4yscale.duckdns.org:11001'
#alias radio-listen='mplayer http://gr4yscale.duckdns.org:11001'
alias radio-kill='sudo killall mpv' # should get the correct process id probably

alias radio-next="ssh -p 39909 gr4yscale@gr4yscale.duckdns.org 'mpc next'"
alias radio-prev="ssh -p 39909 gr4yscale@gr4yscale.duckdns.org 'mpc prev'"
alias radio-pause="ssh -p 39909 gr4yscale@gr4yscale.duckdns.org 'mpc pause'"
alias radio-play="ssh -p 39909 gr4yscale@gr4yscale.duckdns.org 'mpc play'"


alias englishtoserbian='trans en:sr-Latn'
alias serbiantoenglish='trans sr-Latn:en'
