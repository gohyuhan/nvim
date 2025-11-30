return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre",
    dependencies = { "williamboman/mason.nvim" },
    config = function()
      local mason_bin = vim.fn.stdpath "data" .. "/mason/bin"
      vim.env.PATH = mason_bin .. ":" .. vim.env.PATH
      require("conform").setup(require "configs.conform")
    end,
  },

  {
    "williamboman/mason.nvim",
    cmd = { "Mason", "MasonInstall", "MasonUpdate" },
    opts = {
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    },
  },

  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    dependencies = { "williamboman/mason.nvim" },
    opts = {
      ensure_installed = {
        -- ========================
        -- LSPs (Language Servers)
        -- ========================
        "lua_ls", -- Lua
        "pyright", -- Python
        "gopls", -- Go
        "rust_analyzer", -- Rust
        "ts_ls", -- JS/TS
        "html", -- HTML
        "cssls", -- CSS
        "jsonls", -- JSON
        "yamlls", -- YAML
        "bashls", -- Bash
        "clangd", -- C/C++
        "jdtls", -- Java
        "intelephense", -- PHP
        "lemminx", -- XML
        "terraformls", -- Terraform
        "taplo", -- TOML
        "dockerls", -- Docker
        "kotlin_language_server", -- Kotlin (NEW)
        "solargraph", -- Ruby (NEW)
        "omnisharp", -- C# (NEW)
        "sqlls", -- SQL (NEW)

        -- ========================
        -- Formatters & Linters
        -- ========================
        "hadolint", -- Docker Linter
        "stylua", -- Lua
        "ruff", -- Python
        "gofumpt", -- Go
        "prettier", -- Web
        "shfmt", -- Shell
        "clang-format", -- C/C++
        "csharpier", -- C#
        "google-java-format", -- Java
        "php-cs-fixer", -- PHP
        "rubocop", -- Ruby
        "ktlint", -- Kotlin
        "swiftformat", -- Swift
        "sqlfluff", -- SQL
        "xmlformat", -- XML
      },
      auto_update = true,
      run_on_start = true,
    },
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },
}
