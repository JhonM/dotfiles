nmap <silent> <leader>t :TestNearest<CR>
nmap <silent> <leader>T :TestFile<CR>
nmap <silent> <leader>a :TestSuite<CR>
nmap <silent> <leader>l :TestLast<CR>
nmap <silent> <leader>g :TestVisit<CR>


" Compute the nearest folder (upwards) that has a package.json
function! s:nearest_pkg_root() abort
  let l:dir = expand('%:p:h')
  while 1
    if filereadable(l:dir . '/package.json')
      return l:dir
    endif
    let l:parent = fnamemodify(l:dir, ':h')
    if l:parent ==# l:dir
      return getcwd()
    endif
    let l:dir = l:parent
  endwhile
endfunction

" Set the working dir test.vim will use (must be a *string*, not a list)
autocmd FileType javascript,typescript,javascriptreact,typescriptreact
      \ let test#project_root = s:nearest_pkg_root()

" 2) Runner: String
let g:test#javascript#runner = 'vitest'

" 3) Executable: String
let g:test#javascript#vitest#executable = 'pnpm vitest'

" 4) Options: Dictionary
let g:test#javascript#vitest#options = { 'nearest': '--run --mode development', 'file': '--run --mode development', 'suite': '--run --mode development', 'visit': '--mode development' }

" 5) Strategy: String
let g:test#strategy = 'neovim'

" 6) File pattern: String
let g:test#javascript#vitest#file_pattern = '\v(test|spec)\.(ts|tsx|js|jsx)$'
