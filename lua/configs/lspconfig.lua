-- Load NvChad's default LSP behavior
require("nvchad.configs.lspconfig").defaults()

-- List all installed servers here
local servers = {
  "lua_ls", -- Mason: lua-language-server
  "pyright", -- Mason: pyright
  "gopls", -- Mason: gopls
  "rust_analyzer", -- Mason: rust-analyzer (Must use underscore!)
  "ts_ls", -- Mason: typescript-language-server
  "html", -- Mason: html-lsp
  "cssls", -- Mason: css-lsp
  "jsonls", -- Mason: json-lsp
  "yamlls", -- Mason: yaml-language-server
  "bashls", -- Mason: bash-language-server
  "clangd", -- Mason: clangd
  "jdtls", -- Mason: jdtls
  "intelephense", -- Mason: intelephense
  "lemminx", -- Mason: lemminx
  "terraformls", -- Mason: terraform-ls
  "taplo", -- Mason: taplo
  "dockerls", -- Mason: dockerfile-language-server
  "kotlin_language_server", -- Mason: kotlin-language-server
  "solargraph", -- Mason: solargraph
  "omnisharp", -- Mason: omnisharp
  "sqlls", -- Mason: sqls (Note: 'sqlls' or 'sqls' depends on config, usually sqlls for lspconfig)
}

vim.lsp.enable(servers)
-- read :h vim.lsp.config for changing options of lsp servers
