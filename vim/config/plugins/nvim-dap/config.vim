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

vim.keymap.set("n", "<F5>", dap.continue)
vim.keymap.set("n", "<F10>", dap.step_over)
vim.keymap.set("n", "<F11>", dap.step_into)
vim.keymap.set("n", "<F12>", dap.step_out)
vim.keymap.set("n", "<Leader>b", dap.toggle_breakpoint)
vim.keymap.set("n", "<Leader>B", function()
  dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
end)
EOF

