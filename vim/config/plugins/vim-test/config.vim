nmap <silent> <leader>t :TestNearest<CR>
nmap <silent> <leader>T :TestFile<CR>
nmap <silent> <leader>a :TestSuite<CR>
nmap <silent> <leader>l :TestLast<CR>
nmap <silent> <leader>g :TestVisit<CR>

" Set vim-test to use Jest and recognize .test.tsx files
let test#javascript#jest#file_pattern = '\v(__tests__/.*|(spec|test))\.(js|jsx|ts|tsx)$'
let test#javascript#runner = 'jest'

" Set the root directory for the frontend project
let test#project_root = 'frontend'

" Use Neovim's terminal for running tests
let test#strategy = 'neovim'

" Automatically set the project root based on the filetype
autocmd FileType javascript,typescript,typescriptreact,tsx,jsx let test#project_root = 'frontend'
