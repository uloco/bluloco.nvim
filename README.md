![banner-light](./screenshots/banner-light.svg#gh-light-mode-only)
![banner-dark](./screenshots/banner-dark.svg#gh-dark-mode-only)

# Bluloco.nvim

A fancy and sophisticated designer neovim theme built with [lush.nvim](https://github.com/rktjmp/lush.nvim).
It features a much more comprehensive usage of syntax scopes and color
consistency, with due regards to aesthetics, contrast and readability.
There is a light and dark variant.
Most popular plugins are also supported, see [Plugins](#plugins)

This theme also works very good with blue light filters like Apple's _Nightshift Mode_ or _f.lux_.

This is a port of the popular Visual Studio Code Themes
[Bluloco Light](https://github.com/uloco/theme-bluloco-light) and
[Bluloco Dark](https://github.com/uloco/theme-bluloco-dark)

### Support

If you like using this, please consider donating a little bit. It takes a lot of time to keep this updated with neovim and plugin updates.
I want to keep bluloco a great experience for everybody and your help would be immensely motivating to keep me doing this. :)

<a href="https://www.buymeacoffee.com/umipaloomi" target="_blank"><img src="https://cdn.buymeacoffee.com/buttons/v2/default-violet.png" alt="Buy Me A Coffee" style="height: 60px !important;width: 217px !important;" ></a> <a href="https://www.paypal.com/donate/?hosted_button_id=YSDKWM2D66GZJ" target="_blank"><img src="https://pics.paypal.com/00/s/OGRmNzQwNTMtZGNiYS00MTIzLWE1ZWUtNWI2ZDdhMGUwMWVm/file.PNG" alt="PayPal Donate" style="height: 60px !important;" ></a>

### Dark

![dark](./screenshots/dark.png)

### Light

![light](./screenshots/light.png)

## Features

- Auto switching light & dark style
- Configureable _transparency_ and _italics_
- Exhaustive plugin support
- Written in lua

## Plugins

Currently supported (aka. tested) plugins:

- [treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
- [hlargs](https://github.com/m-demare/hlargs.nvim)
- [alpha-nvim](https://github.com/goolord/alpha-nvim)
- [nvim-notify](https://github.com/rcarriga/nvim-notify)
- [mason.nvim](https://github.com/williamboman/mason.nvim)
- [nvim-cursorword](https://github.com/xiyaowong/nvim-cursorword)
- [vim-illuminate](https://github.com/RRethy/vim-illuminate)
- [nvim-scrollbar](https://github.com/petertriho/nvim-scrollbar)
- [lualine.nvim](https://github.com/hoob3rt/lualine.nvim)
- [barbar.nvim](https://github.com/romgrk/barbar.nvim)
- [nvim-bufferline.lua](https://github.com/akinsho/nvim-bufferline.lua)
- [indent-blankline.nvim](https://github.com/lukas-reineke/indent-blankline.nvim)
- [neogit](https://github.com/TimUntersberger/neogit)
- [diffview.nvim](https://github.com/sindrets/diffview.nvim)
- [git-conflict.nvim](https://github.com/akinsho/git-conflict.nvim)
- [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim)
- [nvim-cmp](https://github.com/hrsh7th/nvim-cmp)
- [blink.cmp](https://github.com/Saghen/blink.cmp)
- [vim-which-key](https://github.com/liuchengxu/vim-which-key)
- [which-key.nvim](https://github.com/folke/which-key.nvim)
- [todo-comments.nvim](https://github.com/folke/todo-comments.nvim)
- [trouble.nvim](https://github.com/folke/trouble.nvim)
- [nvim-tree.lua](https://github.com/kyazdani42/nvim-tree.lua)
- [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)
- [telescope-file-browser.nvim](https://github.com/nvim-telescope/telescope-file-browser.nvim)
- [fzf-lua](https://github.com/ibhagwan/fzf-lua)
- [lsp-config](https://github.com/neovim/lsp-config)
- [lspsaga.nvim](https://github.com/glepnir/lspsaga.nvim)
- [leap.nvim](https://github.com/ggandor/leap.nvim)

### Plugin showcase

You can see a lot of screenshots of themed plugins in the [wiki page](https://github.com/uloco/bluloco.nvim/wiki#screenshots).
No config needed, works out of the box.

## Install

Install Bluloco with your favorite package manager.

### [packer](https://github.com/wbthomason/packer.nvim)

```lua
use {
    'uloco/bluloco.nvim',
    requires = { 'rktjmp/lush.nvim' }
}
```

### [lazy.nvim](https://github.com/folke/lazy.nvim)

```lua
{
  'uloco/bluloco.nvim',
  lazy = false,
  priority = 1000,
  dependencies = { 'rktjmp/lush.nvim' },
  config = function()
    -- your optional config goes here, see below.
  end,
},
```

## Usage

> ⚠️ The `setup()` function is optional but please call it
> **before** you set the colorscheme if you want to adjust the config.

These are the default values:

```lua
require("bluloco").setup({
  style = "auto",               -- "auto" | "dark" | "light"
  transparent = false,
  italics = false,
  terminal = vim.fn.has("gui_running") == 1, -- bluoco colors are enabled in gui terminals per default.
  guicursor   = true,
})

vim.opt.termguicolors = true
vim.cmd('colorscheme bluloco')
```

You can also apply the style variant directly.
These are especially helpful when switching in an already running vim session.

```vim
:colorscheme bluloco-dark
:colorscheme bluloco-light
```

#### Lualine

Make sure your lualine settings are set to auto:

```lua
require('lualine').setup {
  options = {
    theme = 'auto'
  }
}
```

## Config

### style

There are three styles you can configure here: `auto`, `dark` and `light`.
The `auto` setting is the default and will adjust automatically to your
`vim.o.background` value. If you change this value during runtime, it will also adjust accordingly.

> ℹ️ The style value only applies if you set the theme with `vim.cmd('colorscheme bluloco')`.
> Setting the theme with a variant directly will override this setting.

### transparency (default: false)

This setting will disable the background and use the default background of your terminal.
You need to enable this if you want the terminal to be transparent. You would still need to
configure your terminal accordingly for light and dark backgrounds when switching often.

### italics (default: false)

This setting will enable italics for _keywords_, _comments_ and _markup attributes_.

### terminal (default: true in gui, otherwise false)

This setting will enable the bluloco colors in your integrated terminal.
You most likely want to keep your terminal colors instead of overriding them if you are running neovim in a terminal.
When you are running neovim inside a gui application this setting is enabled per default.

You can skip the `terminal` setting completely to have it disabled in terminals and enabled in gui neovim.

> ℹ️ Please note that some terminals will display bold text as the bright color variant but enabling this feature will override this behavior in the intergrated terminal. This is by design and has nothing to do with this theme. [see](https://github.com/neovim/neovim/issues/11335)

### guicursor (default: true)

This setting sets a guicursor to fix your terminal cursor and make it colorful (as intended).
It is enabled by default.
If you want to override this, make sure to set your `:set guicursor` after loading the theme or disable it completely.

<!-- ## Recipes
### Auto switching light & dark themes
 -->

## Terminal Colors

I've added a bunch of terminal themes for your terminal emulators. I've used the great [iTerm-Color-Schemes](https://github.com/mbadolato/iTerm2-Color-Schemes)
repository for this, thanks @mbadolato!

They are located at `terminal-themes/`. Please follow your terminals installation guide in how to apply them.

## Switching light and dark theme according your OS settings

This themes light and dark variant are meant to be used during day and night.
To make this easily possible I am using the [auto-dark-mode.nvim](https://github.com/f-person/auto-dark-mode.nvim) plugin
For a seamless integration make sure your `bluloco.config.style` is set to `"auto"`.
My _auto-dark-mode.nvim_ config looks like this:

```lua
local auto_dark_mode = require('auto-dark-mode')

local function isAuto()
  return require('bluloco').config.style == 'auto'
end

auto_dark_mode.setup({
  update_interval = 1000,
  set_dark_mode = function()
    if isAuto() then
      vim.o.background = 'dark'
    end
  end,
  set_light_mode = function()
    if isAuto() then
      vim.o.background = 'light'
    end
  end
})
```

If you are also using lazygit as your git client, you might be interested in this [wiki guide](https://github.com/uloco/bluloco.nvim/wiki/Lazygit-%E2%80%90-Delta-%E2%80%90-Bat-%E2%80%90-Auto-Style) to set it up correctly with bluloco.
Auto-dark light mode included.

## Contributing

I'd be more than happy for any bugs you find and add an [issue](https://github.com/uloco/bluloco.nvim/issues).
Pull requests are warmly welcome especially for missing plugin support.
