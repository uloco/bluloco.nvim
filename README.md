# Bluloco.nvim

A fancy but yet sophisticated light and dark designer neovim theme built with [lush.nvim](https://github.com/rktjmp/lush.nvim).
It features a much more comprehensive usage of syntax scopes and color
consistency, with due regards to aesthetics, contrast and readability.
Most popular plugins are also supported, see _plugins_ (link)

This theme also works very good when Apple's **Nightshift Mode** is activated.

This is a port of the popular Visual Studio Code Themes
[Bluloco Light](https://github.com/uloco/theme-bluloco-light) and
[Bluloco Dark](https://github.com/uloco/theme-bluloco-dark)

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

Currently supported plugins are:

- [treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
- [hlargs](https://github.com/m-demare/hlargs.nvim)
- [lsp](https://github.com/neovim/lsp-config)
- [lspsaga](https://github.com/glepnir/lspsaga.nvim)
- [telescope](https://github.com/nvim-telescope/telescope.nvim)
- [telescope-file-browser](https://github.com/nvim-telescope/telescope-file-browser.nvim)
- [nvim-tree](https://github.com/kyazdani42/nvim-tree.lua)
- [trouble](https://github.com/folke/trouble.nvim)
- [todo-comments](https://github.com/folke/todo-comments.nvim)
- [which-key](https://github.com/liuchengxu/vim-which-key)
- [cmp](https://github.com/hrsh7th/nvim-cmp)
- [gitsigns](https://github.com/lewis6991/gitsigns.nvim)
- [git-conflict](https://github.com/akinsho/git-conflict.nvim)
- [diffview](https://github.com/sindrets/diffview.nvim)
- [neogit](https://github.com/TimUntersberger/neogit)
- [indent-blankline](https://github.com/lukas-reineke/indent-blankline.nvim)
- [bufferline](https://github.com/akinsho/nvim-bufferline.lua)
- [barbar](https://github.com/romgrk/barbar.nvim)
- [lualine](https://github.com/hoob3rt/lualine.nvim)
- [scrollbar](https://github.com/petertriho/nvim-scrollbar)
- [illuminated](https://github.com/RRethy/vim-illuminate)
- [cursorword](https://github.com/xiyaowong/nvim-cursorword)
- [mason](https://github.com/williamboman/mason.nvim)
- [notify](https://github.com/rcarriga/nvim-notify)
- [alpha](https://github.com/goolord/alpha-nvim)

<!--
TODO:
<details>
<summary> Example config </summary>
</details
- Foldable with screenshots
- Add needed config hereF -->

## Install

Install Bluloco with [packer](https://github.com/wbthomason/packer.nvim):

```lua
use {
    'uloco/bluloco.nvim',
    requires = { 'rktjmp/lush.nvim' }
}
```

## Usage

Enable the colorscheme with defaults.

> ⚠️ The `setup()` function is optional but please call it
> **before** you set the colorscheme if you want to adjust the config.

```lua
require("bluloco").setup({
  style = "auto"               -- "auto" | "dark" | "light"
  transparent = false,
  italics = false,
})

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

### Style

There are three styles you can configure here: `auto`, `dark` and `light`.  
The `auto` setting is the default and will adjust automatically to your
`vim.o.background` value. If you change this value during runtime, it will also adjust accordingly.

> ℹ️ The style value only applies if you set the theme with `vim.cmd('colorscheme bluloco')`.  
> Setting the theme with a variant directly will override this setting.

### Transparency

This setting will disable the background and use the default background of your terminal.
You need to enable this if you want the terminal to be transparent. You would still need to
configure your terminal accordingly for light and dark backgrounds when switching often.

<!-- TODO:  See: auto switching themes.
See: bluloco theme for iTerm2 -->

### Italics

This setting will enable italics for _keywords_, _comments_ and _markup attributes_.

<!-- ## Recipes
### Auto switching light & dark themes
 -->

## Contributing

I'd be more than happy for any bugs you find and add an [issue](https://github.com/uloco/bluloco.nvim/issues).  
Pull requests are warmly welcome especially for missing plugin support.
