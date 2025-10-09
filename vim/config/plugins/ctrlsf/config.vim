" auto focus when search is done
let g:ctrlsf_auto_focus = {
      \ "at": "done",
      \ "durattion_less_than": 1000
      \}

" preview file while moving from match to match
let g:ctrlsf_auto_preview = 1

" position
let g:ctrlsf_position = 'bottom'

nmap     <C-F>f <Plug>CtrlSFPrompt
vmap     <C-F>f <Plug>CtrlSFVwordPath
vmap     <C-F>F <Plug>CtrlSFVwordExec
nmap     <C-F>n <Plug>CtrlSFCwordPath
nmap     <C-F>p <Plug>CtrlSFPwordPath
nnoremap <C-F>o :CtrlSFOpen<CR>
nnoremap <C-F>t :CtrlSFToggle<CR>
inoremap <C-F>t <Esc>:CtrlSFToggle<CR>
