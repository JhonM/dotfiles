lua << EOF
local ok, avante = pcall(require, "avante")

if not ok then
  vim.notify("Failed to load avante.nvim: " .. tostring(avante), vim.log.levels.ERROR)
  return
end

avante.setup({
  provider = "copilot",

  providers = {
    copilot = {
      model = "copilot/gpt-5.3-codex",
    }
  },
  behaviour = {
    auto_suggestions = false,
  },
  mode = "agentic",
})

vim.keymap.set("n", "<leader>aa", "<cmd>AvanteAsk<CR>", { desc = "Avante ask" })
vim.keymap.set("v", "<leader>ae", "<cmd>AvanteEdit<CR>", { desc = "Avante edit selection" })
vim.keymap.set("n", "<leader>at", "<cmd>AvanteToggle<CR>", { desc = "Avante toggle" })
vim.keymap.set("n", "<leader>ar", "<cmd>AvanteRefresh<CR>", { desc = "Avante refresh" })
vim.keymap.set("n", "<leader>am", "<cmd>AvanteModels<CR>", { desc = "Avante models" })
EOF
