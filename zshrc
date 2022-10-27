# Version 1.3.21 2022-06-28
# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

DEFAULT_USER=gb


export LS_COLORS='no=00:fi=00:di=01;32:ln=00;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=41;33;01:ex=00;32:*.cmd=00;32:*.exe=01;32:*.com=01;32:*.bat=01;32:*.btm=01;32:*.dll=01;32:*.tar=00;31:*.tbz=00;31:*.tgz=00;31:*.rpm=00;31:*.deb=00;31:*.arj=00;31:*.taz=00;31:*.lzh=00;31:*.lzma=00;31:*.zip=00;31:*.zoo=00;31:*.z=00;31:*.Z=00;31:*.gz=00;31:*.bz2=00;31:*.tb2=00;31:*.tz2=00;31:*.tbz2=00;31:*.avi=01;35:*.bmp=01;35:*.fli=01;35:*.gif=01;35:*.jpg=01;35:*.jpeg=01;35:*.mng=01;35:*.mov=01;35:*.mpg=01;35:*.pcx=01;35:*.pbm=01;35:*.pgm=01;35:*.png=01;35:*.ppm=01;35:*.tga=01;35:*.tif=01;35:*.xbm=01;35:*.xpm=01;35:*.dl=01;35:*.gl=01;35:*.wmv=01;35:*.aiff=00;32:*.au=00;32:*.mid=00;32:*.mp3=00;32:*.ogg=00;32:*.voc=00;32:*.wav=00;32:'

export LANG='en_US.UTF-8'
export LC_ALL='en_US.UTF-8'

# From https://jdhao.github.io/2021/03/24/zsh_history_setup/
export HISTSIZE=50000 # the number of items for the internal history list
export SAVEHIST=10000 # maximum number of items for the history file

setopt HIST_IGNORE_ALL_DUPS  # do not put duplicated command into history list
setopt HIST_SAVE_NO_DUPS  # do not save duplicated command
setopt HIST_REDUCE_BLANKS  # remove unnecessary blanks
setopt INC_APPEND_HISTORY_TIME  # append command to history file immediately after execution
setopt EXTENDED_HISTORY  # record command start time

### add alias as per os using $_myos ###
_myos="$(uname)"

setopt extended_glob

case $_myos in
  Linux)
    ZSH_THEME="tonotdo-custom-linux"
    source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
    alias open'=xdg-open'
    alias ps-walkingdead='ps -el | grep Z'
    alias systemctl-list-service='systemctl list-unit-files --type=service'
    alias sudo='nocorrect sudo'
    alias stats-motd='sh /etc/profile.d/stats-motd.sh'
    alias ssh-git='eval "$(ssh-agent -s)" && ssh-add /home/vm/.ssh/github_rsa'
    alias sshLoginSUSE='ssh -i ~/.ssh/login_rsa vmoutoussamy@login.nue.suse.com'
    alias startMiniSles154='sudo virsh start Minimal-SLES15.4 && sleep 30 && sshMiniSles154'
    alias startMiniLeap154='sudo virsh start Minimal-Leap15.4 && sleep 30 && sshMiniLeap154'
    alias startMiniFedora36='sudo virsh start Minimal-Fedora36 && sleep 30 && sshMiniFedora36'
  ;;
   Darwin)
    ZSH_THEME="tonotdo-custom"
    # FIXME: handle arguments to vpnRouteSUSE
    source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
    # Using openSSL, Ruby from Homebrew
    export PATH="$(brew --prefix coreutils)/libexec/gnubin:/usr/local/opt/ruby@2.7/bin:/usr/local/opt/openssl@1.1/bin:/usr/local/sbin/:$PATH"
    # Using GNU SED instead of macOS sed
    export PATH="/usr/local/opt/gnu-sed/libexec/gnubin:$PATH"
    # Aliases
    alias gitlab='cd /Users/gb/Sandbox/GIT/LAB/'
    alias github='cd /Users/gb/Sandbox/GIT/HUB/'
    alias updateBrew='echo "\n ### Update ### \n"; brew -v update && echo "\n ### Upgrade ### \n"; brew upgrade && echo "\n ### Cleanup ### \n"; brew cleanup && echo "\n ### Doctor ### \n"; brew doctor'
    alias flushDNS='dscacheutil -flushcache && sudo killall -HUP mDNSResponder'
    alias firefox-profile='/Applications/Firefox.app/Contents/MacOS/firefox-bin -P'
    alias mountISO='hdiutil mount'
    alias networkConfig='/Users/gb/Sandbox/GIT/HUB/networkconfig/networkconfig.sh'
    alias sshLoginSUSE='ssh vmoutoussamy@login.nue.suse.com'
    alias reloadDNSmasq='sudo launchctl stop homebrew.mxcl.dnsmasq && sudo launchctl start homebrew.mxcl.dnsmasq'
    alias config='/usr/bin/git --git-dir=/Users/gb/.cfg/ --work-tree=/Users/gb'
    alias TextEdit='open -a TextEdit'
    alias send_mail='/Users/gb/Sandbox/GIT/LAB/send-mail-beta/mvc/controller/send_mail.rb'
  ;;
   *) ;;
esac


# Network aliases:
alias pingg='ping -c 5 www.google.fr'
alias myip='dig +short myip.opendns.com @resolver1.opendns.com'

# Process aliases :
alias psm='ps -efc -m'
alias psaux'=ps aux'

# ssh aliases:
alias sshEuklid='ssh vmoutoussamy@euklid.suse.de'
alias sshZiu='ssh vmoutoussamy@ziu.suse.de'
alias sshMiniOuille='ssh gb@miniouille'
alias sshMiniLeap154='ssh gb@minileap154'
alias sshMiniSles154='ssh gb@minisles154'
alias sshMiniFedora36='ssh gb@minifedora36'

#System aliases:
alias history='history -E'
alias work='screen -x WORK'
alias iosc='osc -A https://api.suse.de'
alias list-mount='mount | column -t'

# Documents aliases:
alias filetree="ls -R | grep ":$" | sed -e 's/:$//' -e 's/[^-][^\/]*\//--/g' -e 's/^/ /' -e 's/-/|/'"
alias cp='cp -v'
alias mv='mv -v'
alias rm='rm -i'

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Uncomment this to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)


# Customize to your needs...
export EDITOR=vim


#! /bin/zsh
# A script to make using 256 colors in zsh less painful.
# P.C. Shyamshankar <sykora@lucentbeing.com>
# Copied from https://github.com/sykora/etc/blob/master/zsh/functions/spectrum/

typeset -AHg FX FG BG

FX=(
    reset     "%{[00m%}"
    bold      "%{[01m%}" no-bold      "%{[22m%}"
    italic    "%{[03m%}" no-italic    "%{[23m%}"
    underline "%{[04m%}" no-underline "%{[24m%}"
    blink     "%{[05m%}" no-blink     "%{[25m%}"
    reverse   "%{[07m%}" no-reverse   "%{[27m%}"
)

for color in {000..255}; do
    FG[$color]="%{[38;5;${color}m%}"
    BG[$color]="%{[48;5;${color}m%}"
done


ZSH_SPECTRUM_TEXT=${ZSH_SPECTRUM_TEXT:-Arma virumque cano Troiae qui primus ab oris}

# Show all 256 colors with color number
function spectrum_ls() {
  for code in {000..255}; do
    print -P -- "$code: %{$FG[$code]%}$ZSH_SPECTRUM_TEXT%{$reset_color%}"
  done
}

# Show all 256 colors where the background is set to specific color
function spectrum_bls() {
  for code in {000..255}; do
    print -P -- "$code: %{$BG[$code]%}$ZSH_SPECTRUM_TEXT%{$reset_color%}"
  done
}
source $ZSH/oh-my-zsh.sh
