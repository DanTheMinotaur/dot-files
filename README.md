# dot-files
Unix config files

Clone Repo
```shell
git clone --recursive git@github.com:DanTheMinotaur/dot-files.git
```

```shell
# With generated templates
./install --plugin-dir '.dotbot/plugins/dotbot-template/' 

# Install nix packages
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

## Possible Errors

### error: file 'nixpkgs' was not found in the Nix search path

```shell
nix-channel --add https://nixos.org/channels/nixpkgs-unstable
nix-channel --update
