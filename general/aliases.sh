# Replace ls with exa
alias ls='exa -al --color=always --group-directories-first --icons' # preferred listing
alias la='exa -a --color=always --group-directories-first --icons'  # all files and dirs
alias ll='exa -l --color=always --group-directories-first --icons'  # long format
alias lt='exa -aT --color=always --group-directories-first --icons' # tree listing
alias l.='exa -ald --color=always --group-directories-first --icons .*' # show only dotfiles
alias ip='ip -color'

alias tarnow='tar -acf '
alias untar='tar -zxvf '
alias wget='wget -c '

alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# Hardware Info
alias hw='hwinfo --short'   

alias please='sudo'

alias df="df -h"

alias cat="bat -P"

alias free="free -m"

alias copy="rsync -ahr --progress"

alias rm="rm -i"

alias cp="cp -i" 

# Get the error messages from journalctl
alias jctl="journalctl -p 3 -xb"

alias grubup="sudo update-grub"