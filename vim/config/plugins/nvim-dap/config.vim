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

-- Configure JavaScript/TypeScript debugging with vscode-js-debug
dap.adapters.node2 = {
  type = 'executable',
  command = 'node',
  args = { os.getenv('HOME') .. '/.local/share/nvim/mason/packages/node-debug2-adapter/out/src/nodeDebug.js' },
}

-- Configuration for debugging Node.js
dap.configurations.javascript = {
  {
    name = 'Launch Node.js',
    type = 'node2',
    request = 'launch',
    program = '${file}',
    cwd = '${workspaceFolder}',
    sourceMaps = true,
    protocol = 'inspector',
    console = 'integratedTerminal',
  },
  {
    name = 'Attach to Node Process',
    type = 'node2',
    request = 'attach',
    processId = require('dap.utils').pick_process,
    cwd = '${workspaceFolder}',
    sourceMaps = true,
  },
}

-- Configuration for TypeScript
dap.configurations.typescript = {
  {
    name = 'Launch TypeScript',
    type = 'node2',
    request = 'launch',
    program = '${file}',
    cwd = '${workspaceFolder}',
    sourceMaps = true,
    protocol = 'inspector',
    console = 'integratedTerminal',
    outFiles = { "${workspaceFolder}/dist/**/*.js" },
    runtimeExecutable = 'node',
    runtimeArgs = { '--loader', 'ts-node/esm' },
  },
  {
    name = 'Attach to TypeScript Process',
    type = 'node2',
    request = 'attach',
    processId = require('dap.utils').pick_process,
    cwd = '${workspaceFolder}',
    sourceMaps = true,
    outFiles = { "${workspaceFolder}/dist/**/*.js" },
  },
}

-- Configuration for React/TypeScript in browser
dap.adapters.chrome = {
  type = 'executable',
  command = 'node',
  args = { os.getenv('HOME') .. '/.local/share/nvim/mason/packages/chrome-debug-adapter/out/src/chromeDebug.js' }
}

dap.configurations.javascriptreact = {
  {
    name = 'Debug React App',
    type = 'chrome',
    request = 'launch',
    url = 'http://localhost:3000',
    webRoot = '${workspaceFolder}',
    sourceMaps = true,
    sourceMapPathOverrides = {
      ['webpack:///src/*'] = '${webRoot}/src/*',
    },
    userDataDir = false,
  }
}

dap.configurations.typescriptreact = dap.configurations.javascriptreact

-- Configuration for Astro
dap.configurations.astro = {
  {
    name = 'Debug Astro App',
    type = 'chrome',
    request = 'launch',
    url = 'http://localhost:4321', -- Default Astro dev server port
    webRoot = '${workspaceFolder}',
    sourceMaps = true,
    sourceMapPathOverrides = {
      ['webpack:///src/*'] = '${webRoot}/src/*',
    },
    userDataDir = false,
  }
}

-- Configuration for Jest tests
dap.configurations.javascript = vim.list_extend(dap.configurations.javascript, {
  {
    type = 'node2',
    request = 'launch',
    name = 'Jest Tests',
    program = '${workspaceFolder}/node_modules/.bin/jest',
    args = { '--runInBand' },
    cwd = '${workspaceFolder}',
    console = 'integratedTerminal',
    internalConsoleOptions = 'neverOpen',
    sourceMaps = true,
  }
})

-- Configuration for Vitest
dap.configurations.javascript = vim.list_extend(dap.configurations.javascript, {
  {
    type = 'node2',
    request = 'launch',
    name = 'Vitest',
    program = '${workspaceFolder}/node_modules/.bin/vitest',
    args = { 'run' },
    cwd = '${workspaceFolder}',
    console = 'integratedTerminal',
    internalConsoleOptions = 'neverOpen',
    sourceMaps = true,
  }
})

-- Configuration for Playwright
dap.configurations.javascript = vim.list_extend(dap.configurations.javascript, {
  {
    type = 'node2',
    request = 'launch',
    name = 'Playwright Tests',
    program = '${workspaceFolder}/node_modules/.bin/playwright',
    args = { 'test' },
    cwd = '${workspaceFolder}',
    console = 'integratedTerminal',
    internalConsoleOptions = 'neverOpen',
    sourceMaps = true,
  }
})

-- Configuration for debugging pnpm scripts
dap.configurations.javascript = vim.list_extend(dap.configurations.javascript, {
  {
    type = 'node2',
    request = 'launch',
    name = 'Debug pnpm Script',
    runtimeExecutable = 'pnpm',
    runtimeArgs = function()
      local script_name = vim.fn.input('Script name: ')
      return { 'run', script_name }
    end,
    cwd = '${workspaceFolder}',
    console = 'integratedTerminal',
    internalConsoleOptions = 'neverOpen',
    sourceMaps = true,
  }
})

-- Add a custom command to start debugging the current workspace with Astro
vim.api.nvim_create_user_command('DebugAstro', function()
  dap.run({
    name = 'Debug Astro App',
    type = 'chrome',
    request = 'launch',
    url = 'http://localhost:4321',
    webRoot = vim.fn.getcwd(),
    sourceMaps = true,
    sourceMapPathOverrides = {
      ['webpack:///src/*'] = vim.fn.getcwd() .. '/src/*',
    },
    userDataDir = false,
  })
end, {})

-- Add a custom command to debug the current project's web app
vim.api.nvim_create_user_command('DebugWeb', function()
  local cmd = vim.fn.input('Command to debug (dev/test/build): ', 'dev')
  dap.run({
    type = 'node2',
    request = 'launch',
    name = 'Debug Web App',
    runtimeExecutable = 'pnpm',
    runtimeArgs = { '--filter', 'web', 'run', cmd },
    cwd = vim.fn.getcwd(),
    console = 'integratedTerminal',
    sourceMaps = true,
  })
end, {})

-- Set up DAP UI
dapui.setup({
  layouts = {
    {
      elements = {
        { id = "scopes", size = 0.25 },
        { id = "breakpoints", size = 0.25 },
        { id = "stacks", size = 0.25 },
        { id = "watches", size = 0.25 },
      },
      size = 40,
      position = "left",
    },
    {
      elements = {
        { id = "repl", size = 0.5 },
        { id = "console", size = 0.5 },
      },
      size = 10,
      position = "bottom",
    },
  },
})

-- Automatically open and close dapui when starting/stopping debugging
dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end

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

