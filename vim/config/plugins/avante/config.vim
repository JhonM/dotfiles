autocmd! User avante.nvim

lua << EOF

require('img-clip').setup ({
})
require('copilot').setup ({
})
require('avante_lib').load()
require('avante').setup ({
})

EOF
