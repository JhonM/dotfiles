" The dependencies are already loaded from individual files in plugins.vim
" Just load the Avante plugin itself
Plug 'yetone/avante.nvim', { 'branch': 'main', 'do': { -> avante#build('source=true') } }
"Plug 'yetone/avante.nvim', { 'branch': 'main', 'do': 'make' }
