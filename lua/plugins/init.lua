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
    -- cmd = { "Mason", "MasonInstall", "MasonUpdate" },
    lazy = false,
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
    -- cmd = { "MasonToolsInstall" },
    lazy = false,
    opts = {
      ensure_installed = {
        -- ========================
        -- LSPs (Language Servers)
        -- ========================
        "lua-language-server", -- Lua
        "pyright", -- Python
        "gopls", -- Go
        "rust-analyzer", -- Rust
        "typescript-language-server", -- JS/TS
        "html-lsp", -- HTML
        "css-lsp", -- CSS
        "json-lsp", -- JSON
        "yaml-language-server", -- YAML
        "bash-language-server", -- Bash
        "clangd", -- C/C++
        "jdtls", -- Java
        "intelephense", -- PHP
        "lemminx", -- XML
        "terraform-ls", -- Terraform
        "taplo", -- TOML
        "dockerfile-language-server", -- Docker
        "kotlin-language-server", -- Kotlin
        -- "solargraph", -- Ruby
        "omnisharp", -- C#
        "sqls", -- SQL

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
        -- "csharpier", -- C#
        "google-java-format", -- Java
        "php-cs-fixer", -- PHP
        -- "rubocop", -- Ruby
        "ktlint", -- Kotlin
        "swiftlint", -- Swift
        "sqlfluff", -- SQL
        "xmlformatter", -- XML
        "buf", -- Protobuf
      },
      auto_update = true,
      run_on_start = true,
      integrations = {
        ["mason-lspconfig"] = true,
        ["mason-null-ls"] = true,
        ["mason-nvim-dap"] = true,
      },
    },
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  {
    "MeanderingProgrammer/render-markdown.nvim",
    ft = { "markdown", "codecompanion" },
    opts = {
      file_types = { "markdown", "codecompanion" },
      anti_conceal = {
        enabled = false,
      },
      -- This handles the plugin's internal rendering
      anti_aliasing = { enabled = true },
      on_cursor = "hidden",

      heading = {
        enabled = true,
        sign = true,
        position = "overlay",
        icons = { "󰭻 ", "", "󰧑 ", "", "", "" },
      },
    },
    config = function(_, opts)
      require("render-markdown").setup(opts)

      vim.opt.conceallevel = 2
      vim.opt.concealcursor = "nvic" -- Hide markup in Normal, Visual, Insert, and Command modes

      -- FOR NVCHAD: Force it again whenever you enter a CodeCompanion buffer
      -- because NvChad/CodeCompanion might reset buffer-local options
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "codecompanion",
        callback = function()
          vim.opt_local.conceallevel = 2
          vim.opt_local.concealcursor = "nvic"
        end,
      })
    end,
  },
}
