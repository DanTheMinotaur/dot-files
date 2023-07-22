
# Fish command history
function history
    builtin history --show-time='%F %T '
end

function backup --argument filename
    cp $filename $filename.bak
end

# Functions needed for !! and !$ https://github.com/oh-my-fish/plugin-bang-bang
function __history_previous_command
  switch (commandline -t)
  case "!"
    commandline -t $history[1]; commandline -f repaint
  case "*"
    commandline -i !
  end
end

function __history_previous_command_arguments
  switch (commandline -t)
  case "!"
    commandline -t ""
    commandline -f history-token-search-backward
  case "*"
    commandline -i '$'
  end
end

if [ "$fish_key_bindings" = fish_vi_key_bindings ];
  bind -Minsert ! __history_previous_command
  bind -Minsert '$' __history_previous_command_arguments
else
  bind ! __history_previous_command
  bind '$' __history_previous_command_arguments
end

## Starship prompt
if status --is-interactive
   starship init fish | source
end

if test -e ~/.env
    source ~/.env
end

if test -e "$HOME/.dotfiles/myaliases.sh"
    source "$HOME/.dotfiles/myaliases.sh"
end

# # MacOS
# if type -sq "rvm"
#     rvm default
# end

# # Java on MacOS
# if test -f /usr/libexec/java_home
#     # export JAVA_17_HOME=(/usr/libexec/java_home -v 17)
#     # export JAVA_11_HOME=(/usr/libexec/java_home -v 11.0.11)
#     export JAVA_8_HOME=(/usr/libexec/java_home -v 1.8.0_242)
#     # alias java17="export JAVA_HOME={$JAVA_17_HOME}"
#     # alias java11="export JAVA_HOME=$JAVA_11_HOME"
#     alias java8="export JAVA_HOME={$JAVA_8_HOME}"
#     #set default to Java 17
#     java8
# end
