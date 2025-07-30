# Hide welcome message
set fish_greeting
set VIRTUAL_ENV_DISABLE_PROMPT "1"
set -x MANPAGER "sh -c 'col -bx | bat -l man -p'"

## Export variable need for qt-theme
if type "qtile" >> /dev/null 2>&1
   set -x QT_QPA_PLATFORMTHEME "qt5ct"
end

# Set settings for https://github.com/franciscolourenco/done
set -U __done_min_cmd_duration 10000
set -U __done_notification_urgency_level low


## Environment setup
# Apply .profile: use this to put fish compatible .profile stuff in
if test -f ~/.fish_profile
  source ~/.fish_profile
end

# Add ~/.local/bin to PATH
if test -d ~/.local/bin
    if not contains -- ~/.local/bin $PATH
        set -p PATH ~/.local/bin
    end
end

## Starship prompt
if status --is-interactive
   starship init fish | source
end

set dotfiles "$HOME/.dotfiles/aliases.sh" "$HOME/.config/fish/functions/functions.fish" "$HOME/.env"

for df in $dotfiles
  if test -e $df
    source $df
  end
end

if test (uname) = 'Darwin'
  source "$HOME/.dotfiles/macos.fish"
end

if test (uname) = 'Linux'
  if test -e '/etc/arch-release'
    ## Advanced command-not-found hook
    source /usr/share/doc/find-the-command/ftc.fish
  end
end

# Run fastfetch if session is interactive
if status --is-interactive && type -q fastfetch
  fastfetch # --load-config neofetch
end

if type -q pyenv
  pyenv init - | source
end

if test -f ~/.dotfiles/custom.sh
  bass source ~/.dotfiles/custom.sh
end

alias history="builtin history --show-time='%F %T ' --reverse search --contains"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/daniel/google-cloud-sdk/path.fish.inc' ]; . '/home/daniel/google-cloud-sdk/path.fish.inc'; end

alias history="builtin history --show-time='%F %T ' --reverse search --contains"
