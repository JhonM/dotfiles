-- Keymaps configuration

-- Set leader key to space
vim.g.mapleader = ' '

-- Disable arrow keys in normal mode
vim.keymap.set('n', '<Up>', '<Nop>', { noremap = true })
vim.keymap.set('n', '<Down>', '<Nop>', { noremap = true })
vim.keymap.set('n', '<Left>', '<Nop>', { noremap = true })
vim.keymap.set('n', '<Right>', '<Nop>', { noremap = true })
vim.keymap.set('n', '<Space>', '<Nop>', { noremap = true })

-- Window navigation
vim.keymap.set('n', '<leader>w', '<C-W>', { noremap = true })

-- Buffer navigation
vim.keymap.set('n', '<leader>bn', ':bn<CR>', { noremap = true })
vim.keymap.set('n', '<leader>bp', ':bp<CR>', { noremap = true })
vim.keymap.set('n', '<leader>bnd', ':bn|bd#<CR>', { noremap = true })
vim.keymap.set('n', '<leader>bpd', ':bp|bd#<CR>', { noremap = true })

-- Git commands
vim.keymap.set('n', '<leader>gf', ':GitFiles?<CR>', { noremap = true })
vim.keymap.set('n', '<leader>gl', ':Git log<CR>', { noremap = true })
vim.keymap.set('n', '<leader>gb', ':Git blame<CR>', { noremap = true })

-- Buffer delete
vim.keymap.set('n', '<leader>q', ':Bdelete<CR>', { noremap = true })

-- Terminal function
local function open_terminal()
  vim.cmd('split term://zsh')
  vim.cmd('resize 10')
end

vim.keymap.set('n', '<leader>n', open_terminal, { noremap = true })
