-- Load NvChad's default LSP behavior
require("nvchad.configs.lspconfig").defaults()

-- List all installed servers here
local servers = {
  "html",
  "cssls",
  "ts_ls",
  "clangd",
  "gopls",
  "pyright",
  "lua_ls",
  "rust_analyzer",
  "bashls",
  "jsonls",
  "yamlls",
  "intelephense",
  "terraformls",
  "lemminx",
  "taplo",
  "dockerls",
  "jdtls",
  "kotlin_language_server",
  "solargraph",
  "omnisharp",
  "sqlls",
}

vim.lsp.enable(servers)
-- read :h vim.lsp.config for changing options of lsp servers
