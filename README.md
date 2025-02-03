# Introduction

This plugin provides a keymapping to execute a Vimscript/Lua/Python/Ruby/Perl code snippet

# Installation

## Prerequisites:

- Neovim 0.10 or higher
- For other languages than Vimscript and Lua, you need to set up their respective providers. See `:h provider-python`, `:h provider-ruby`, `:h provider-perl` for instructions.

## Install using your favorite plugin manager.

For example, with lazy.nvim:

```lua
{
    "brianhuster/snipexec.nvim",
}
```

vim-plug:
```vim
Plug 'brianhuster/snipexec.nvim'
```

Native "packages":
```bash
git clone --depth=1 https://github.com/brianhuster/snipexec.nvim.git ~/.local/share/nvim/site/pack/vendor/start/snipexec.nvim
```

# Usage

For usage and configuration, see [`:h snipexec.nvim`]()

When you change option `keymap`, for example from `g=` to `yx`, the keymappings will be updated like this:
- `g={motion}` will become `yx{motion}`
- `{Visual}g=` will become `yx{Visual}`
- `g==` will become `yxx` (the last character is duplicated)

# Credits:
- [vim-scriptease](https://github.com/tpope/vim-scriptease)
