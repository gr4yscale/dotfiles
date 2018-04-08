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



# Set up fzf
[ -f ~/.fzf.bash ] && source ~/.fzf.bash


# Set up Node Version Manager (slows down launching a terminal, i just source this manually)
alias nvm-init='source /usr/share/nvm/init-nvm.sh'


###### chromium app aliases
alias gmail='chromium  --app=https://mail.google.com/mail/u/0/#starred'
alias gcal='chromium --app="https://calendar.google.com" --new-window &'
alias simplenote='chromium --app="https://app.simplenote.com" --new-window &'
alias messenger='chromium  --app=https://www.messenger.com'
alias slack='chromium --app=https://otherworldly.slack.com/messages/D72R0KDFX/'
alias whatsapp='chromium --app=https://web.whatsapp.com'
alias zeplin='chromium --app=https://app.zeplin.io/project/58deb96cf03250bdbe60a4ca'
alias mopidy='chromium --app=http://192.168.0.14:6680/musicbox_webclient/'


#youtube-dl (vid)
alias yt-vid="youtube-dl -f 'bestvideo[ext=mp4]+bestaudio[ext=m4a]/best[ext=mp4]/best' -w -i"
alias yt-aud="youtube-dl -x --audio-format best --audio-quality 320k --audio-format mp3 --embed-thumbnail -w -i -o '%(title)s.%(ext)s'"

alias fpvrider='~/bin/FPVFreerider_Recharged_Linux_2018-02-19/FPVFreerider_Recharged.x86_64'
alias velocidrone='~/bin/velocidrone-1-11-0-418-linux-rc/velocidrone.x86_64'
