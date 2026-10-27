# fish shell configuration

Fish plugins are managed by Fisher. The plugin list lives in
`fish/fish_plugins` and is linked to `~/.config/fish/fish_plugins` by the
package step before Fisher runs.

Install or update all plugins:

```shell
./install packages
```

Removing a plugin from `fish/fish_plugins` and running `./install packages`
uninstalls it.

Fisher also copies the plugin files into
`~/.config/fish/{functions,conf.d,completions,themes}`. Those files are not
dotfile-managed; only `config.fish`, `functions.fish` and `fish_plugins` are
linked by dotbot (the first two in the links step, `fish_plugins` in the
packages step).
