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

" Callback used by termopen()
function! s:OnExit(win, job_id, code, event) abort
  if a:code == 0
    echom '? Tests passed'
    call nvim_win_close(a:win, v:true)
  else
    echom '? Tests failed (exit code '.a:code.')'
  endif
endfunction

" Use a costom floating window
let g:test#strategy = 'floating'

function! s:FloatingTerm(cmd) abort
  " create a scratch buffer
  let buf = nvim_create_buf(v:false, v:true)

  " Calculate window size (80% of the screen)
  let width = float2nr(&columns * 0.8)
  let height = float2nr(&lines * 0.8)
  let row = float2nr((&lines - height) / 2)
  let col = float2nr((&columns - width) / 2)

  " Open a floating window
  let opts = {
        \ 'relative': 'editor',
        \ 'width': width,
        \ 'height': height,
        \ 'row': row,
        \ 'col': col,
        \ 'style': 'minimal',
        \ 'border': 'rounded'
        \ }

  let win = nvim_open_win(buf, v:true, opts)

  call nvim_win_set_option(win, 'winhl', 'Normal:NormalFloat')

  " Run test command in a terminal
  " call termopen(a:cmd, { 'on_exit': function('s:OnExit', [win]) })
  call termopen(a:cmd, { 'on_exit': { job_id, code, event ->
        \ execute('echom "Test finished with exit code " . code')
        \ }})
  startinsert
endfunction


" Register the floating strategy
let g:test#custom_strategies = { 'floating': function('s:FloatingTerm')}
