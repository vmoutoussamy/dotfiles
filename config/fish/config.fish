### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
set --export --prepend PATH "/Users/gb/.rd/bin"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)
abbr -a -- gst 'git status'
abbr -a -- gbr 'git branch'
abbr -a -- github 'cd /Users/gb/Sandbox/GIT/HUB/'
abbr -a -- gd 'git diff'
abbr -a -- gp 'git push'
abbr -a -- gl 'git pull'
abbr -a -- gco 'git checkout'
abbr -a -- gcs 'git commit -S -m'
abbr -a -- pingd 'ping -c 5 www.duckduckgo.com'
abbr -a -- flushDNS 'dscacheutil -flushcache && sudo killall -HUP mDNSResponder'
abbr -a -- updateBrew 'echo " ### Update ### "; brew -v update && echo " ### Upgrade ### "; brew upgrade && echo " ### Cleanup ### "; brew cleanup && echo " ### Doctor ### "; brew doctor'
abbr -a -- networkConfig '/Users/gb/Sandbox/GIT/HUB/networkconfig/networkconfig.sh'
abbr -a -- reloadDNSmasq 'sudo launchctl stop homebrew.mxcl.dnsmasq && sudo launchctl start homebrew.mxcl.dnsmasq'
