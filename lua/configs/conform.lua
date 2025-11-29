local options = {
  formatters_by_ft = {
    -- Lua
    lua = { "stylua" },

    -- Python
    python = { "black" },

    -- Go
    go = { "gofumpt" },

    -- Rust
    rust = { "rustfmt" },

    -- Web Stack (Prettier handles all of these)
    javascript = { "prettier" },
    typescript = { "prettier" },
    javascriptreact = { "prettier" }, -- This handles .jsx
    typescriptreact = { "prettier" }, -- This handles .tsx
    svelte = { "prettier" },
    css = { "prettier" },
    html = { "prettier" },
    json = { "prettier" },
    yaml = { "prettier" },
    markdown = { "prettier" },
    ["markdown.inline"] = { "prettier" },

    -- Shell / Bash
    sh = { "shfmt" },
    bash = { "shfmt" },

    -- Dockerfile & Vim
    -- We do NOT list them here explicitly. 
    -- Because we set `lsp_fallback = true` in your keymap, 
    -- these will automatically use the Language Server (dockerls / vimls) 
    -- to format without needing extra config.
  },

  format_on_save = {
    timeout_ms = 250,
    lsp_fallback = true,
  },
}
