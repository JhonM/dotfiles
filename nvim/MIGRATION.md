# Migration Guide: Vim Script to Lua

This guide explains how to migrate from the original Vim script configuration to the new Lua-based configuration.

## Key Changes

1. **Plugin Manager**: Changed from vim-plug to packer.nvim
2. **Configuration Structure**: Modular Lua files instead of sourced Vim script files
3. **Plugin Configuration**: Individual Lua files for each plugin

## Migration Steps

### 1. Initial Setup

The new configuration is located in `~/.config/nvim/` instead of `~/.dotfiles/vim/`.

### 2. Plugin Migration

For each plugin:
1. Add the plugin to `lua/config/plugins.lua`
2. Create a configuration file in `lua/plugins/`
3. Add the plugin to the loader in `lua/config/plugin_loader.lua`

### 3. Vim Script to Lua Conversion Guide

#### Vim Variables to Lua

```vim
" Vim
let g:variable = 'value'
```

```lua
-- Lua
vim.g.variable = 'value'
```

#### Vim Options to Lua

```vim
" Vim
set number
set tabstop=2
```

```lua
-- Lua
vim.opt.number = true
vim.opt.tabstop = 2
```

#### Vim Mappings to Lua

```vim
" Vim
nnoremap <leader>f :Files<CR>
```

```lua
-- Lua
vim.keymap.set('n', '<leader>f', ':Files<CR>', { noremap = true })
```

#### Vim Autocommands to Lua

```vim
" Vim
augroup MyGroup
  autocmd!
  autocmd BufEnter * echo "Entered buffer"
augroup END
```

```lua
-- Lua
local my_group = vim.api.nvim_create_augroup('MyGroup', { clear = true })
vim.api.nvim_create_autocmd('BufEnter', {
  group = my_group,
  pattern = '*',
  callback = function()
    print('Entered buffer')
  end
})
```

### 4. Testing the Migration

1. Start Neovim with the new configuration
2. Run `:checkhealth` to verify everything is working
3. Test each plugin to ensure it's functioning correctly

### 5. Troubleshooting

If you encounter issues:
1. Check the Neovim logs with `:messages`
2. Verify plugin installation with `:PackerStatus`
3. Check for Lua syntax errors

## Continuing the Migration

Not all plugins have been fully migrated yet. To continue the migration:
1. Identify the remaining Vim script configurations
2. Convert them to Lua following the patterns in this guide
3. Add them to the appropriate files in the new structure
