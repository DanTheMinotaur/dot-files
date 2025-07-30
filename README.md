# dot-files
Unix config files

Clone Repo
```shell
git clone --recursive git@github.com:DanTheMinotaur/dot-files.git
```

```shell
# Create config links
./install 
# With generated templates
./install --plugin-dir '.dotbot/plugins/dotbot-template/' 

# Install nix packages
# If system has SELinux
# https://github.com/DeterminateSystems/nix-installer 
./install --plugin-dir '.dotbot/plugins/dotbot-nix-env/'
```


## Notes

**Update git submodules**
```shell
git submodule update --recursive --remote
```

**Add new submodule**
```shell
cd .dotbot/plugins/
git submodule add git@github.com:DanTheMinotaur/dotbot-nix-env.git 
```

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
