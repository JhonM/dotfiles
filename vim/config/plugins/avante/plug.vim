" Command parsing dependencies required by Avante.
Plug 'ColinKennedy/mega.logging'
Plug 'ColinKennedy/mega.cmdparse'

" Other dependencies are loaded from individual files in plugins.vim.
Plug 'yetone/avante.nvim', { 'branch': 'main', 'do': { -> avante#build('source=true') } }
