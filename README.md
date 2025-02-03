# Introduction

This plugin provides a keymapping to execute a Vimscript/Lua/Python/Ruby/Perl code snippet

# Installation

## Prerequisites:

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

# Usage

By default, the plugin will map the following keymappings for supported filetypes:

- `g={motion}`: Executes the text the motion moves over.
- `{Visual}g=`: Executes the visually selected text.
- `g==`: Executes the current line.

# Configuration

You can configure the keymapping and the filetypes it applies to. Below is the default configuration:

```lua
require('snipexec.config').set({
    keymap = 'g=',
    filetypes = { 'lua', 'vim', 'python', 'ruby', 'perl' },
})
```

When you change option `keymap`, for example from `g=` to `yx`, the keymappings will be updated like this:
- `g={motion}` will become `yx{motion}`
- `{Visual}g=` will become `yx{Visual}`
- `g==` will become `yxx` (the last character is duplicated)

# Credits:
- [vim-scriptease](https://github.com/tpope/vim-scriptease)
