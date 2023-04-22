# telescope-cica-icons.nvim

A [Telescope](https://github.com/nvim-telescope/telescope.nvim) extension for searching and inserting [Cica](https://github.com/miiton/Cica) icons in Neovim.

## Motivation

This extension was created to provide an easy way to search for and insert Cica icons using related keywords, similar to how NerdFonts works. However, please note that the tagging of icons is not yet complete, which means that the search functionality might not be perfect. The project is a work in progress, and contributions are welcome to improve the tags and overall functionality.

## Installation

### vim-plug

First, install the `telescope.nvim` plugin if you haven't already:

```vim
Plug 'nvim-telescope/telescope.nvim'
```

Next, install the `telescope-cica-icons.nvim` plugin:

```vim
Plug 'your_username/telescope-cica-icons.nvim'
```

Don't forget to run `:PlugInstall`!

### packer.nvim

```lua
use {
  'nvim-telescope/telescope.nvim',
  requires = { 'tetzng/telescope-cica-icons.nvim' },
}
```

## Setup

Load the extension in your `init.vim` or `init.lua`:

```lua
require('telescope').load_extension('cica_icons')
```

### Recommended Keybind

```lua
vim.keymap.set("n", "<leader>fc", "<cmd>Telescope cica_icons<cr>", desc = "Find cica icons")
```

## Usage

To search and insert Cica icons, run the following command:

```
:Telescope cica_icons
```

This will open a picker with a list of Cica icons. You can search by typing in the input field. Select an icon and press `<CR>` (Enter) to insert the icon at the current cursor position.

## Customization

If you want to change the default action performed when selecting an icon, you can do so by passing a custom `action` function in the `setup` function:

```lua
require('telescope').setup {
  extensions = {
    cica_icons = {
      action = function(icon)
        -- Your custom action here
      end,
    },
  },
}
```
