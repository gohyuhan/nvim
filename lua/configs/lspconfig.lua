-- Load NvChad's default LSP behavior
require("nvchad.configs.lspconfig").defaults()

-- List all installed servers here
local servers = {
  "cssls",
  "docker_compose_language_service",
  "dockerls",
  "html",
  "lua_ls",
  "ruff_lsp",
  "rust_analyzer",
  "svelte",
  "tailwindcss",
  "tsserver",
  "yamlls",
}

vim.lsp.enable(servers)
-- read :h vim.lsp.config for changing options of lsp servers 
