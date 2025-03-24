-- CoC (Conquer of Completion) configuration

return function()
  -- Global extensions
  vim.g.coc_global_extensions = {
    'coc-css',
    'coc-eslint',
    'coc-prettier',
    'coc-highlight',
    'coc-html',
    'coc-json',
    'coc-snippets',
    'coc-stylelint',
    'coc-tag',
    'coc-ember',
    'coc-tsserver',
    'coc-yaml',
    'coc-tabnine',
    'coc-emmet',
    'coc-explorer',
    'coc-vetur',
    'coc-spell-checker',
    '@yaegassy/coc-tailwindcss3'
  }

  -- Basic settings
  vim.opt.hidden = true
  vim.opt.backup = false
  vim.opt.writebackup = false
  vim.opt.cmdheight = 2
  vim.opt.updatetime = 300
  vim.opt.shortmess:append('c')
  vim.opt.signcolumn = 'yes'

  -- Tab completion
  vim.api.nvim_set_keymap('i', '<TAB>', 'pumvisible() ? "\\<C-n>" : v:lua.check_back_space() ? "\\<TAB>" : coc#refresh()', {expr = true, silent = true})
  vim.api.nvim_set_keymap('i', '<S-TAB>', 'pumvisible() ? "\\<C-p>" : "\\<C-h>"', {expr = true})

  -- Helper function for tab completion
  _G.check_back_space = function()
    local col = vim.fn.col('.') - 1
    return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
  end

  -- Trigger completion with <c-space>
  vim.api.nvim_set_keymap('i', '<c-space>', 'coc#refresh()', {expr = true, silent = true})

  -- Make <CR> auto-select the first completion item
  vim.api.nvim_set_keymap('i', '<cr>', 'pumvisible() ? coc#_select_confirm() : "\\<C-g>u\\<CR>\\<c-r>=coc#on_enter()\\<CR>"', {expr = true, silent = true})

  -- Navigate diagnostics
  vim.api.nvim_set_keymap('n', '[g', '<Plug>(coc-diagnostic-prev)', {silent = true})
  vim.api.nvim_set_keymap('n', ']g', '<Plug>(coc-diagnostic-next)', {silent = true})

  -- GoTo code navigation
  vim.api.nvim_set_keymap('n', 'gd', '<Plug>(coc-definition)', {silent = true})
  vim.api.nvim_set_keymap('n', 'gy', '<Plug>(coc-type-definition)', {silent = true})
  vim.api.nvim_set_keymap('n', 'gi', '<Plug>(coc-implementation)', {silent = true})
  vim.api.nvim_set_keymap('n', 'gr', '<Plug>(coc-references)', {silent = true})

  -- Use K to show documentation
  vim.api.nvim_set_keymap('n', 'K', ':call v:lua.show_documentation()<CR>', {silent = true})

  -- Show documentation function
  _G.show_documentation = function()
    if vim.tbl_contains({'vim', 'help'}, vim.bo.filetype) then
      vim.cmd('h ' .. vim.fn.expand('<cword>'))
    elseif vim.fn['coc#rpc#ready']() then
      vim.fn.CocActionAsync('doHover')
    else
      vim.cmd('!' .. vim.o.keywordprg .. ' ' .. vim.fn.expand('<cword>'))
    end
  end

  -- Highlight the symbol and references on CursorHold
  vim.api.nvim_create_autocmd('CursorHold', {
    pattern = '*',
    callback = function()
      vim.fn.CocActionAsync('highlight')
    end
  })

  -- Symbol renaming
  vim.api.nvim_set_keymap('n', '<leader>rn', '<Plug>(coc-rename)', {})

  -- Formatting selected code
  vim.api.nvim_set_keymap('x', '<leader>f', '<Plug>(coc-format-selected)', {})
  vim.api.nvim_set_keymap('n', '<leader>f', '<Plug>(coc-format-selected)', {})

  -- Setup formatexpr for specific filetypes
  vim.api.nvim_create_augroup('CocGroup', {})
  vim.api.nvim_create_autocmd('FileType', {
    group = 'CocGroup',
    pattern = 'typescript,json',
    command = 'setl formatexpr=CocAction("formatSelected")'
  })

  -- Update signature help on jump placeholder
  vim.api.nvim_create_autocmd('User', {
    group = 'CocGroup',
    pattern = 'CocJumpPlaceholder',
    command = 'call CocActionAsync("showSignatureHelp")'
  })

  -- Apply codeAction to the selected region
  vim.api.nvim_set_keymap('x', '<leader>a', '<Plug>(coc-codeaction-selected)', {})
  vim.api.nvim_set_keymap('n', '<leader>a', '<Plug>(coc-codeaction-selected)', {})

  -- Remap keys for applying codeAction to the current buffer
  vim.api.nvim_set_keymap('n', '<leader>ac', '<Plug>(coc-codeaction)', {})
  
  -- Apply AutoFix to problem on the current line
  vim.api.nvim_set_keymap('n', '<leader>qf', '<Plug>(coc-fix-current)', {})

  -- Map function and class text objects
  vim.api.nvim_set_keymap('x', 'if', '<Plug>(coc-funcobj-i)', {})
  vim.api.nvim_set_keymap('o', 'if', '<Plug>(coc-funcobj-i)', {})
  vim.api.nvim_set_keymap('x', 'af', '<Plug>(coc-funcobj-a)', {})
  vim.api.nvim_set_keymap('o', 'af', '<Plug>(coc-funcobj-a)', {})
  vim.api.nvim_set_keymap('x', 'ic', '<Plug>(coc-classobj-i)', {})
  vim.api.nvim_set_keymap('o', 'ic', '<Plug>(coc-classobj-i)', {})
  vim.api.nvim_set_keymap('x', 'ac', '<Plug>(coc-classobj-a)', {})
  vim.api.nvim_set_keymap('o', 'ac', '<Plug>(coc-classobj-a)', {})

  -- Scroll float windows/popups
  vim.api.nvim_set_keymap('n', '<C-f>', 'coc#float#has_scroll() ? coc#float#scroll(1) : "\\<C-f>"', {expr = true, nowait = true})
  vim.api.nvim_set_keymap('n', '<C-b>', 'coc#float#has_scroll() ? coc#float#scroll(0) : "\\<C-b>"', {expr = true, nowait = true})
  vim.api.nvim_set_keymap('i', '<C-f>', 'coc#float#has_scroll() ? "\\<c-r>=coc#float#scroll(1)\\<cr>" : "\\<Right>"', {expr = true, nowait = true})
  vim.api.nvim_set_keymap('i', '<C-b>', 'coc#float#has_scroll() ? "\\<c-r>=coc#float#scroll(0)\\<cr>" : "\\<Left>"', {expr = true, nowait = true})

  -- NeoVim-only mapping for visual mode scroll
  if vim.fn.has('nvim') then
    vim.api.nvim_set_keymap('v', '<C-f>', 'coc#float#has_scroll() ? coc#float#nvim_scroll(1, 1) : "\\<C-f>"', {expr = true, nowait = true})
    vim.api.nvim_set_keymap('v', '<C-b>', 'coc#float#has_scroll() ? coc#float#nvim_scroll(0, 1) : "\\<C-b>"', {expr = true, nowait = true})
  end

  -- Use CTRL-S for selections ranges
  vim.api.nvim_set_keymap('n', '<C-s>', '<Plug>(coc-range-select)', {silent = true})
  vim.api.nvim_set_keymap('x', '<C-s>', '<Plug>(coc-range-select)', {silent = true})

  -- Add commands
  vim.api.nvim_create_user_command('Format', 'call CocActionAsync("format")', {})
  vim.api.nvim_create_user_command('Fold', 'call CocActionAsync("fold", <f-args>)', {nargs = '?'})
  vim.api.nvim_create_user_command('OR', 'call CocActionAsync("runCommand", "editor.action.organizeImport")', {})
  vim.api.nvim_create_user_command('Prettier', 'call CocActionAsync("runCommand", "prettier.formatFile")', {})

  -- Add statusline support
  vim.opt.statusline:prepend('%{coc#status()}%{get(b:,"coc_current_function","")}')

  -- Mappings for CoCList
  vim.api.nvim_set_keymap('n', '<space>a', ':<C-u>CocList diagnostics<cr>', {silent = true, nowait = true})
  vim.api.nvim_set_keymap('n', '<space>e', ':<C-u>CocList extensions<cr>', {silent = true, nowait = true})
  vim.api.nvim_set_keymap('n', '<space>c', ':<C-u>CocList commands<cr>', {silent = true, nowait = true})
  vim.api.nvim_set_keymap('n', '<space>o', ':<C-u>CocList outline<cr>', {silent = true, nowait = true})
  vim.api.nvim_set_keymap('n', '<space>s', ':<C-u>CocList -I symbols<cr>', {silent = true, nowait = true})
  vim.api.nvim_set_keymap('n', '<space>j', ':<C-u>CocNext<CR>', {silent = true, nowait = true})
  vim.api.nvim_set_keymap('n', '<space>k', ':<C-u>CocPrev<CR>', {silent = true, nowait = true})
  vim.api.nvim_set_keymap('n', '<space>p', ':<C-u>CocListResume<CR>', {silent = true, nowait = true})

  -- Coc-explorer
  vim.api.nvim_set_keymap('n', '<space>e', ':CocCommand explorer<CR>', {silent = true})

  -- Set winblend for explorer
  vim.api.nvim_create_autocmd('FileType', {
    pattern = 'coc-explorer',
    command = 'set winblend=20'
  })
  vim.api.nvim_create_autocmd('FileType', {
    pattern = 'coc-explorer-border',
    command = 'set winblend=20'
  })

  -- Null function for error handling
  _G.Null = function(error, response) end

  -- Hover group
  local hover_group = vim.api.nvim_create_augroup('hover', {clear = true})
  
  -- Show hover on cursor hold
  vim.api.nvim_create_autocmd('CursorHold', {
    group = hover_group,
    pattern = '*',
    callback = function()
      if not vim.fn['coc#float#has_float']() then
        vim.fn.CocActionAsync('doHover', 'float', _G.Null)
        vim.fn.CocActionAsync('highlight', _G.Null)
      end
    end
  })
  
  -- Show signature help in insert mode
  vim.api.nvim_create_autocmd('CursorHoldI', {
    group = hover_group,
    pattern = '*',
    callback = function()
      if vim.fn.CocActionAsync('ensureDocument') then
        vim.fn.CocActionAsync('showSignatureHelp')
      end
    end
  })
end
