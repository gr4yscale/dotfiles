#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '


#fix emacs colors in tmux
export TERM=xterm-256color

###### unlimited history
export HISTFILESIZE=
export HISTSIZE=
export HISTTIMEFORMAT="[%F %T] "



# Set up fzf
#[ -f ~/.fzf.bash ] && source ~/.fzf.bash


# Set up Node Version Manager (slows down launching a terminal, i just source this manually)
alias nvm-init='source /usr/share/nvm/init-nvm.sh'


###### chromium app aliases
alias gmail='chromium  --app=https://mail.google.com/mail/u/0/#starred'
alias gcal='chromium --app="https://calendar.google.com" --new-window &'
alias simplenote='chromium --app="https://app.simplenote.com" --new-window &'
alias messenger='chromium  --app=https://www.messenger.com'
alias whatsapp='chromium --app=https://web.whatsapp.com'
alias mopidy='chromium --app=http://192.168.0.14:6680/musicbox_webclient/'


#youtube-dl (vid)
alias yt-vid="youtube-dl -f 'bestvideo[ext=mp4]+bestaudio[ext=m4a]/best[ext=mp4]/best' -w -i"
alias yt-aud="youtube-dl -x --audio-format best --audio-quality 320k --audio-format mp3 --embed-thumbnail -w -i -o '%(title)s.%(ext)s'"


# handy shortcuts
alias t='tmux'
alias ta='tmux a'
alias bb='i3lock -c 101010 -u && systemctl suspend'
alias lock='i3lock -c 101010 -u'

#alias hot_connect='sudo netctl start hotspot'
#alias hot_disconnect='sudo netctl stop hotspot; sudo ip link set wlan0 down'

# VM RDP access
alias windoze='rdesktop -g 1920x1080 -P -z -x l -r sound:off -u gr4yscale -p p@ssw0rd 192.168.0.15'
