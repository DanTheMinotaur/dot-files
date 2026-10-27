# dot-files
Unix config files

## Install

Clone the repo:

```shell
git clone --recursive git@github.com:DanTheMinotaur/dot-files.git
```

Programs and dotfiles are installed as separate steps. Run programs first:

```shell
# Nix packages + fish plugins
./install packages

# Dotfile symlinks + templated configs (requires secrets.yml)
./install links

# Or both, in order
./install
```

`./install links` requires `secrets.yml` (gitignored) for the `template`
directive. See `git/gitconfig` and `ssh/config` for the parameters used.

If the system has SELinux, use the Determinate Systems Nix installer:
<https://github.com/DeterminateSystems/nix-installer>

### Fish plugins

Fish plugins are declared in `fish/fish_plugins` and managed by Fisher.
To add or remove a plugin:

1. Edit `fish/fish_plugins`.
2. Run `./install packages`.

Removing a plugin from the list and running the package step uninstalls it.

## Notes

**Update git submodules**
```shell
git submodule update --recursive --remote
```

**Add new dotbot plugin submodule**
```shell
cd .dotbot/plugins/
git submodule add git@github.com:DanTheMinotaur/dotbot-nix-env.git
```

### Migrating from the fish submodule setup

If you previously installed this repo, remove the old fish plugin symlinks once
before running `./install packages`:

### Subtree
> [!IMPORTANT]
> Some git packages don't come with `git subtree` installed by default.

```sh
# add subtree
git subtree add --prefix=shell/tmux https://github.com/gpakosz/.tmux.git master --squash
# update subtree
git subtree pull --prefix=shell/tmux https://github.com/gpakosz/.tmux.git master --squash
```


## Possible Errors

### error: file 'nixpkgs' was not found in the Nix search path

```shell
nix-channel --add https://nixos.org/channels/nixpkgs-unstable
nix-channel --update
```
