# telescope-supercollider.nvim

A [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) extension that adds supercollider finders.

See also [telescope-scdoc](https://github.com/davidgranstrom/telescope-scdoc.nvim) for help file finding.

## Requirements

* scnvim
* telescope

## Installation

Install the plugin

```lua
use { 'madskjeldgaard/telescope-supercollider.nvim' }
```

Load the extension *after* the call to `telescope.setup{}`

```lua
require'telescope'.load_extension('supercollider')
```
## Usage

**Note** scnvim needs to be started (`:SCNvimStart`) before calling these.

Call it directly from lua:

```vim
:lua require'telescope'.extensions.supercollider.sc_definitions()
```

An example of a mapping in scnvim:

```lua
["<F3>"] = scnvim.map(function()
    require 'telescope'.extensions.supercollider.sc_definitions()
  end, { "n", "x", "i" }),

```

## Available finders

* `sc_definitions` - Find definitions of classes and functions
