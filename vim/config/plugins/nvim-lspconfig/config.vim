lua << EOF
require('lspconfig').ts_ls.setup({
  cmd = { "/Users/jhonmajoor/.nvm/versions/node/v18.17.1/bin/typescript-language-server", "--stdio" },
  on_attach = function(client)
    client.server_capabilities.documentFormattingProvider = false  -- ? Disable Formatting (use Prettier instead)
    client.server_capabilities.semanticTokensProvider = nil  -- ? Remove Semantic Highlighting
    client.server_capabilities.renameProvider = false  -- ? Disable Renaming Feature
  end,
  settings = {
    typescript = { format = { enable = false } },
    javascript = { format = { enable = false } },
  },
  handlers = {
    ["textDocument/publishDiagnostics"] = function(_, result, ctx, config)
      if result.diagnostics then
        result.diagnostics = vim.list_slice(result.diagnostics, 1, 5) -- ? Show Only 5 Errors at a Time
      end
      return vim.lsp.diagnostic.on_publish_diagnostics(_, result, ctx, config)
    end,
  },
})
EOF

set updatetime=100

lua << EOF
vim.lsp.set_log_level("off")
EOF
