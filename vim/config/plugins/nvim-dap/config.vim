lua << EOF
local dap = require('dap')
local dapui = require('dapui')

-- UI setup
dapui.setup()

-- Optional: install debug adapters automatically
require('mason').setup()
require('mason-nvim-dap').setup({
  ensure_installed = { 'python', 'node2' },
  automatic_setup = true,
})

-- Python
dap.adapters.python = {
  type = 'executable',
  command = 'python',
  args = { '-m', 'debugpy.adapter' },
}
dap.configurations.python = {
  {
    type = 'python',
    request = 'launch',
    name = 'Launch File',
    program = '${file}',
    pythonPath = 'python',
  }
}

-- UI auto open/close
dap.listeners.after.event_initialized["dapui_config"] = function() dapui.open() end
dap.listeners.before.event_terminated["dapui_config"] = function() dapui.close() end
dap.listeners.before.event_exited["dapui_config"] = function() dapui.close() end

-- Keybindings
vim.keymap.set('n', '<F5>', dap.continue)
vim.keymap.set('n', '<F10>', dap.step_over)
vim.keymap.set('n', '<F11>', dap.step_into)
vim.keymap.set('n', '<F12>', dap.step_out)
vim.keymap.set('n', '<Leader>b', dap.toggle_breakpoint)
vim.keymap.set('n', '<Leader>B', function()
  dap.set_breakpoint(vim.fn.input('Breakpoint condition: '))
end)
EOF

