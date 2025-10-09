lua << EOF
local dap = require('dap')
local dapui = require('dapui')

dapui.setup()

require('mason').setup()
require('mason-nvim-dap').setup({
  ensure_installed = { 'python', 'js-debug-adapter' },
  automatic_setup = true,
})

-- Use pwa-node from js-debug-adapter instead of node2
dap.adapters["pwa-node"] = {
  type = "server",
  host = "localhost",
  port = "${port}",
  executable = {
    command = "node",
    args = {
      os.getenv("HOME") .. "/.local/share/nvim/mason/packages/js-debug-adapter/js-debug/src/dapDebugServer.js",
      "${port}"
    }
  }
}

-- Node.js
dap.configurations.javascript = {
  {
    name = "Launch Node.js",
    type = "pwa-node",
    request = "launch",
    program = "${file}",
    cwd = "${workspaceFolder}",
  },
  {
    name = "Attach to Node Process",
    type = "pwa-node",
    request = "attach",
    processId = require("dap.utils").pick_process,
    cwd = "${workspaceFolder}",
  },
}

-- TypeScript
dap.configurations.typescript = {
  {
    name = "Launch TypeScript",
    type = "pwa-node",
    request = "launch",
    program = "${file}",
    cwd = "${workspaceFolder}",
    outFiles = { "${workspaceFolder}/dist/**/*.js" },
    runtimeExecutable = "node",
    runtimeArgs = { "--loader", "ts-node/esm" },
  },
  {
    name = "Attach to TypeScript Process",
    type = "pwa-node",
    request = "attach",
    processId = require("dap.utils").pick_process,
    cwd = "${workspaceFolder}",
    outFiles = { "${workspaceFolder}/dist/**/*.js" },
  },
}

-- React (browser)
dap.adapters.chrome = {
  type = "executable",
  command = "node",
  args = { os.getenv("HOME") .. "/.local/share/nvim/mason/packages/chrome-debug-adapter/out/src/chromeDebug.js" }
}

dap.configurations.javascriptreact = {
  {
    name = "Debug React App",
    type = "chrome",
    request = "launch",
    url = "http://localhost:3000",
    webRoot = "${workspaceFolder}",
    sourceMaps = true,
    sourceMapPathOverrides = {
      ["webpack:///src/*"] = "${webRoot}/src/*",
    },
    userDataDir = false,
  }
}

dap.configurations.typescriptreact = dap.configurations.javascriptreact

-- Astro
dap.configurations.astro = {
  {
    name = "Debug Astro App",
    type = "chrome",
    request = "launch",
    url = "http://localhost:4321",
    webRoot = "${workspaceFolder}",
    sourceMaps = true,
    sourceMapPathOverrides = {
      ["webpack:///src/*"] = "${webRoot}/src/*",
    },
    userDataDir = false,
  }
}

-- Jest
table.insert(dap.configurations.javascript, {
  type = "pwa-node",
  request = "launch",
  name = "Jest Tests",
  program = "${workspaceFolder}/node_modules/.bin/jest",
  args = { "--runInBand" },
  cwd = "${workspaceFolder}",
  console = "integratedTerminal",
  internalConsoleOptions = "neverOpen",
})

-- Vitest
table.insert(dap.configurations.javascript, {
  type = "pwa-node",
  request = "launch",
  name = "Vitest",
  program = "${workspaceFolder}/node_modules/.bin/vitest",
  args = { "run" },
  cwd = "${workspaceFolder}",
  console = "integratedTerminal",
  internalConsoleOptions = "neverOpen",
})

-- Playwright
table.insert(dap.configurations.javascript, {
  type = "pwa-node",
  request = "launch",
  name = "Playwright Tests",
  program = "${workspaceFolder}/node_modules/.bin/playwright",
  args = { "test" },
  cwd = "${workspaceFolder}",
  console = "integratedTerminal",
  internalConsoleOptions = "neverOpen",
})

-- pnpm scripts
table.insert(dap.configurations.javascript, {
  type = "pwa-node",
  request = "launch",
  name = "Debug pnpm Script",
  runtimeExecutable = "pnpm",
  runtimeArgs = function()
    local script_name = vim.fn.input("Script name: ")
    return { "run", script_name }
  end,
  cwd = "${workspaceFolder}",
  console = "integratedTerminal",
  internalConsoleOptions = "neverOpen",
})

-- debug astro (9292)
vim.api.nvim_create_user_command("DebugAstro", function()
  dap.run({
    name = "Debug Astro App",
    type = "chrome",
    request = "launch",
    url = "https://localhost:4321",
    webRoot = vim.fn.getcwd(),
    sourceMaps = true,
    sourceMapPathOverrides = {
      ["webpack:///src/*"] = vim.fn.getcwd() .. "/src/*",
    },
    userDataDir = false,
  })
end, {})

-- debug astro web (9292)
vim.api.nvim_create_user_command("DebugWeb", function()
  local cmd = vim.fn.input("Command to debug (dev/test/build): ", "dev")
  dap.run({
    type = "pwa-node",
    request = "launch",
    name = "Debug Web App",
    runtimeExecutable = "pnpm",
    runtimeArgs = { "--filter", "web", "run", cmd },
    cwd = vim.fn.getcwd(),
    console = "integratedTerminal",
    sourceMaps = true,
  })
end, {})

vim.api.nvim_create_user_command("DebugWeb2", function()
  local cmd = vim.fn.input("Command to debug (dev/test/build): ", "dev")
  dap.run({
    type = "pwa-node",
    request = "launch",
    name = "Debug Web App",
    runtimeExecutable = "pnpm",
    runtimeArgs = {  "run", cmd },
    cwd = vim.fn.getcwd(),
    console = "integratedTerminal",
    sourceMaps = true,
  })
end, {})

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

dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end

-- Configure breakpoint icons
vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "*",
  desc = "Prevent colorscheme clearing self-defined DAP marker colors",
  callback = function()
      -- Reuse current SignColumn background (except for DapStoppedLine)
      local sign_column_hl = vim.api.nvim_get_hl(0, { name = 'SignColumn' })
      -- if bg or ctermbg aren't found, use bg = 'bg' (which means current Normal) and ctermbg = 'Black'
      -- convert to 6 digit hex value starting with #
      local sign_column_bg = (sign_column_hl.bg ~= nil) and ('#%06x'):format(sign_column_hl.bg) or 'bg'
      local sign_column_ctermbg = (sign_column_hl.ctermbg ~= nil) and sign_column_hl.ctermbg or 'Black'

      vim.api.nvim_set_hl(0, 'DapStopped', { fg = '#00ff00', bg = sign_column_bg, ctermbg = sign_column_ctermbg })
      vim.api.nvim_set_hl(0, 'DapStoppedLine', { bg = '#2e4d3d', ctermbg = 'Green' })
      vim.api.nvim_set_hl(0, 'DapBreakpoint', { fg = '#c23127', bg = sign_column_bg, ctermbg = sign_column_ctermbg })
      vim.api.nvim_set_hl(0, 'DapBreakpointRejected', { fg = '#888ca6', bg = sign_column_bg, ctermbg = sign_column_ctermbg })
      vim.api.nvim_set_hl(0, 'DapLogPoint', { fg = '#61afef', bg = sign_column_bg, ctermbg = sign_column_ctermbg })
  end
})

-- reload current color scheme to pick up colors override if it was set up in a lazy plugin definition fashion
vim.cmd.colorscheme(vim.g.colors_name)

vim.fn.sign_define('DapBreakpoint', {text='●', texthl='DapBreakpoint', linehl='DapBreakpoint', numhl='DapBreakpoint'})
vim.fn.sign_define('DapBreakpointCondition', {text='○', texthl='DapBreakpointCondition', linehl='DapBreakpointCondition', numhl='DapBreakpointCondition'})
vim.fn.sign_define('DapBreakpointRejected', {text='✕', texthl='DapBreakpointRejected', linehl='DapBreakpointRejected', numhl='DapBreakpointRejected'})
vim.fn.sign_define('DapLogPoint', {text='✎', texthl='DapLogPoint', linehl='DapLogPoint', numhl='DapLogPoint'})
vim.fn.sign_define('DapStopped', {text='▶︎', texthl='DapStopped', linehl='DapStopped', numhl='DapStopped'})

-- Floating DAP UI panels
vim.keymap.set("n", "<leader>dw", function()
  dapui.float_element("watches", { enter = true })
end, { desc = "DAP: Show Watches (Float)" })

vim.keymap.set("n", "<leader>ds", function()
  dapui.float_element("scopes", { enter = true })
end, { desc = "DAP: Show Scopes (Float)" })

vim.keymap.set("n", "<leader>dc", function()
  dapui.float_element("console", { enter = true })
end, { desc = "DAP: Show Console (Float)" })

vim.keymap.set("n", "<leader>du", dapui.toggle, { desc = "DAP: Toggle UI Panels" })
vim.keymap.set("n", "<leader>dr", dap.repl.open, { desc = "DAP: Open REPL" })

vim.keymap.set("n", "<F5>", dap.continue)
vim.keymap.set("n", "<F10>", dap.step_over)
vim.keymap.set("n", "<F11>", dap.step_into)
vim.keymap.set("n", "<F12>", dap.step_out)
vim.keymap.set("n", "<Leader>b", dap.toggle_breakpoint)
vim.keymap.set("n", "<Leader>B", function()
  dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
end)
EOF

