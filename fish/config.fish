set ALIASES "$HOME/.dotfiles/aliases.sh"
set ENV "$HOME/.env"

## Starship prompt
if status --is-interactive
   starship init fish | source
end

if test -e $ENV
    source $ENV
end

if test -e $ALIASES
    source $ALIASES
end

if test (uname) = 'Darwin'
  source "$HOME/.dotfiles/macos.fish"
end
