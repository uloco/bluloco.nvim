# Bluloco for tmux

Dark and light tmux themes for status bar, panes, messages and copy mode, using the same
palette as the neovim theme.

## Install

Copy or `stow` the files onto your machine, e.g.

```sh
stow -d extra -t ~ tmux
```

which places the theme files at `~/.config/tmux/`. Then, in your `~/.tmux.conf`:

```tmux
source-file ~/.config/tmux/bluloco-dark.conf
# or
source-file ~/.config/tmux/bluloco-light.conf
```

## Switching light and dark

`bluloco.conf` sources whichever variant `$BLULOCO_STYLE` points at (defaults to dark):

```tmux
source-file ~/.config/tmux/bluloco.conf
```

```sh
tmux set-environment -g BLULOCO_STYLE light   # or dark
tmux source-file ~/.config/tmux/bluloco.conf
```

You can bind this to a key in `~/.tmux.conf`, e.g.

```tmux
bind C-t run-shell 'tmux set-environment -g BLULOCO_STYLE "$(tmux show-environment -g BLULOCO_STYLE 2>/dev/null | grep -q light && echo dark || echo light)"; tmux source-file ~/.config/tmux/bluloco.conf'
```

or drive it from your OS appearance setting, e.g. on macOS:

```sh
if [ "$(defaults read -g AppleInterfaceStyle 2>/dev/null)" = "Dark" ]; then
  tmux set-environment -g BLULOCO_STYLE dark
else
  tmux set-environment -g BLULOCO_STYLE light
fi
```

pairs well with the [auto-dark-mode.nvim](https://github.com/f-person/auto-dark-mode.nvim) recipe
in the main [README](../../README.md#switching-light-and-dark-theme-according-your-os-settings).

## oh-my-tmux

If you use [oh-my-tmux](https://github.com/gpakosz/.tmux), paste the contents of
[`oh-my-tmux/bluloco-dark.conf.local`](./.config/tmux/oh-my-tmux/bluloco-dark.conf.local) or
[`oh-my-tmux/bluloco-light.conf.local`](./.config/tmux/oh-my-tmux/bluloco-light.conf.local)
into your `~/.tmux.conf.local`, replacing the `tmux_conf_theme_colour_*` defaults it ships with.
