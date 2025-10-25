lua << EOF

require('CopilotChat').setup()

vim.g.copilot_no_tab_map = true
vim.keymap.set("i", '<S-Tab>', 'copilot#Accept("\\<S-Tab>")', { expr = true, replace_keycodes = true })

EOF
