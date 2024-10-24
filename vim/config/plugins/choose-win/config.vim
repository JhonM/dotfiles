" map choosewin to - (dash) 
nmap - <Plug>(choosewin)

" Do not do anything if only one window is open. Unfortunately, it makes
" tab handling broken, as the tab chooser won't show up either.
let g:choosewin_return_on_single_win = 0
" Show the letters on the overlay.
let g:choosewin_overlay_enable = 0
let g:choosewin_overlay_shade = 1
let g:choosewin_color_overlay = {
      \ 'gui': ['DodgerBlue3', 'DodgerBlue3'],
      \ 'cterm': [25, 25]
      \ }
let g:choosewin_color_overlay_current = {
      \ 'gui': ['firebrick1', 'firebrick1'],
      \ 'cterm': [124, 124]
      \ }
