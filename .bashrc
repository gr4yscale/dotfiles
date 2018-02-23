#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '


###### unlimited history
export HISTFILESIZE=
export HISTSIZE=
export HISTTIMEFORMAT="[%F %T] "


###### chromium app aliases

alias gmail='chromium  --app=https://mail.google.com/mail/u/0/#starred'
alias gcal='chromium --app="https://calendar.google.com" --new-window &'
alias simplenote='chromium --app="https://app.simplenote.com" --new-window &'
alias messenger='chromium  --app=https://www.messenger.com'
alias slack='chromium --app=https://otherworldly.slack.com/messages/D72R0KDFX/'
alias whatsapp='chromium --app=https://web.whatsapp.com'
alias zeplin='chromium --app=https://app.zeplin.io/project/58deb96cf03250bdbe60a4ca'


# Set up fzf
[ -f ~/.fzf.bash ] && source ~/.fzf.bash


#youtube-dl (vid)
alias yt-vid="youtube-dl -f 'bestvideo[ext=mp4]+bestaudio[ext=m4a]/best[ext=mp4]/best' -w -i"
alias yt-aud="youtube-dl -x --audio-format best --audio-quality 320k --audio-format mp3 --embed-thumbnail -w -i -o '%(title)s.%(ext)s'"


# Set up Node Version Manager
#source /usr/share/nvm/init-nvm.sh 
