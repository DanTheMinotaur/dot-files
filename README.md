# dot-files
Unix config files

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