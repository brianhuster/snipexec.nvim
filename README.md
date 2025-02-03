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

By default, the plugin will map the following keymappings:

- `g={motion}`: Executes the text the motion moves over.
- `g==`: Executes the current line.
- `{Visual}g=`: Executes the visually selected text.

# Credits:
- [vim-scriptease](https://github.com/tpope/vim-scriptease)
