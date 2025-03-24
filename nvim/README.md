# Neovim Configuration

This is a Lua-based Neovim configuration converted from the original Vim script configuration.

## Structure

- `init.lua`: Main entry point that loads all configuration modules
- `lua/config/options.lua`: General Neovim settings and options
- `lua/config/keymaps.lua`: Key mappings
- `lua/config/autocmds.lua`: Autocommands
- `lua/config/plugins.lua`: Plugin management with packer.nvim
- `lua/config/plugin_loader.lua`: Loads all plugin configurations
- `lua/plugins/`: Directory containing individual plugin configurations

## Installation

1. Make sure you have Neovim 0.5+ installed
2. Clone this repository to `~/.config/nvim`
3. Run Neovim and it will automatically install packer.nvim
4. Run `:PackerSync` to install all plugins

## Plugin Management

This configuration uses [packer.nvim](https://github.com/wbthomason/packer.nvim) for plugin management.

To add a new plugin:
1. Add it to `lua/config/plugins.lua`
2. Create a configuration file in `lua/plugins/` if needed
3. Add the plugin to the loader in `lua/config/plugin_loader.lua`

## Converting More Plugins

To convert more plugin configurations from Vim script to Lua:
1. Create a new file in `lua/plugins/` for the plugin
2. Convert the Vim script configuration to Lua
3. Add the plugin to the loader in `lua/config/plugin_loader.lua`

## Troubleshooting

If you encounter any issues:
1. Check the Neovim health with `:checkhealth`
2. Make sure all dependencies are installed
3. Check the plugin configurations for errors
