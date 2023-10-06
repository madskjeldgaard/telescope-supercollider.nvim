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

**Note** scnvim needs to be started (`:SCNvimStart`) before you can browse the documentation.

Use the Telescope command.

```vim
:Telescope sc_definitions
```

## Available finders

* `sc_definitions` - Find definitions of classes and functions
