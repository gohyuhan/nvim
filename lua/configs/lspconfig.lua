-- Load NvChad's default LSP behavior
-- require("nvchad.configs.lspconfig").defaults()

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

-- Override mappings after LSP attaches to a buffer
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local map = vim.keymap.set
    local opts = { buffer = args.buf }

    -- Force Telescope for definitions
    opts.desc = "LSP Definition (Telescope)"
    map("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts)

    -- Force Telescope for references (usually mapped to gD or gr)
    opts.desc = "LSP References (Telescope)"
    map("n", "gD", "<cmd>Telescope lsp_references<CR>", opts)
  end,
})

-- Diagnostic float config
vim.diagnostic.config {
  virtual_text = false,
  float = { border = "rounded", source = true },
}

vim.o.updatetime = 550

-- Auto float: diagnostic if error present, else hover
vim.api.nvim_create_autocmd("CursorHold", {
  callback = function()
    local diagnostics = vim.diagnostic.get(0, {
      lnum = vim.api.nvim_win_get_cursor(0)[1] - 1,
    })

    if #diagnostics > 0 then
      vim.diagnostic.open_float(nil, { focusable = false })
    else
      local clients = vim.lsp.get_clients { bufnr = 0 }
      if #clients > 0 then
        vim.lsp.buf.hover {
          border = "rounded",
          focusable = false,
          silent = true,
        }
      end
    end
  end,
})

vim.api.nvim_create_autocmd("LspAttach", {
  once = true,
  callback = function()
    local cmd

    if vim.fn.executable "fd" == 1 then
      cmd = "fd --type f --hidden --exclude .git -e ts -e tsx -e js -e jsx -e lua -e go -e rs -e py"
    elseif vim.fn.executable "git" == 1 then
      cmd = "git ls-files --cached --others --exclude-standard"
    else
      return
    end

    local files = vim.fn.systemlist(cmd)
    local i = 1
    local batch_size = 20

    local function load_batch()
      local count = 0
      while i <= #files and count < batch_size do
        local file = files[i]
        if file ~= "" then
          local ext = file:match "%.(%w+)$"
          local lsp_exts = { ts = 1, tsx = 1, js = 1, jsx = 1, lua = 1, go = 1, rs = 1, py = 1 }
          if ext and lsp_exts[ext] then
            local bufnr = vim.fn.bufadd(file)
            vim.fn.bufload(bufnr)
            vim.bo[bufnr].buflisted = false
          end
        end
        i = i + 1
        count = count + 1
      end

      if i <= #files then
        vim.schedule(load_batch) -- yield to event loop, then continue
      end
    end

    vim.schedule(load_batch)
  end,
})
