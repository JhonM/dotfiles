" subset of linters to run
let g:ale_linters = { 'jsx': ['stylelint', 'eslint', 'prettier'],  'javascript': ['stylelint', 'eslint', 'prettier'], 'scss': ['prettier'], 'vim': ['vim'], 'bash': ['language-server', 'shellcheck'], 'handlebars': ['prettier', 'eslint'] }
let g:ale_linter_aliases = {'jsx': 'css'}

" :ALEFix will try and fix your JS code with ESLint.
let g:ale_fixers = {'javascript': ['stylelint', 'prettier', 'eslint'], 'scss': ['prettier'], 'handlebars': ['prettier', 'eslint']}
" let g:ale_fixers['javascript'] = ['prettier']

" Set this setting in vimrc if you want to fix files automatically on save.
" This is off by default.
let g:ale_fix_on_save = 1

let g:ale_completion_enabled = 1
let g:ale_sign_column_always = 1
" let g:ale_sign_error = '>>'
" let g:ale_sign_warning = '--'
let g:ale_warn_about_trailing_whitespace = 1

let g:ale_open_list = 1
" Set this if you want to.
" This can be useful if you are combining ALE with
" some other plugin which sets quickfix errors, etc.
let g:ale_keep_list_window_open = 0
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1

" Only run linters named in ale_linters settings.
let g:ale_linters_explicit = 1

" Set this. Airline will handle the rest.
let g:airline#extensions#ale#enabled = 1
