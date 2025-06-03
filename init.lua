vim.g.base46_cache = vim.fn.stdpath "data" .. "/base46/"
vim.g.mapleader = " "

-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end

vim.opt.rtp:prepend(lazypath)
vim.opt.clipboard = "unnamedplus"
vim.opt.relativenumber = true

local lazy_config = require "configs.lazy"

-- load plugins
require("lazy").setup({
  {
    "NvChad/NvChad",
    lazy = false,
    branch = "v2.5",
    import = "nvchad.plugins",
  },

  { import = "plugins" },
}, lazy_config)

require("nvim-tree").setup {
  filters = {
    git_ignored = false,  -- ← this disables .gitignore filtering
    dotfiles = false,     -- optional: show dotfiles like .env, .gitignore
  },
  actions = {
    open_file = {
      quit_on_open = false,
    },
  },
  on_attach = function(bufnr)
    local api = require("nvim-tree.api")
    -- Load default nvim-tree mappings
    api.config.mappings.default_on_attach(bufnr)
    -- Add custom mapping for creating a file/folder
    vim.keymap.set('n', '<leader>N', api.fs.create, { buffer = bufnr, noremap = true, silent = true })
    vim.keymap.set('n', '<leader>R', api.fs.rename, { buffer = bufnr, noremap = true, silent = true })
    vim.keymap.set('n', '<leader>D', api.fs.remove, { buffer = bufnr, noremap = true, silent = true })

    -- Remove default 'a' mapping for creating file/folder
    vim.keymap.set('n', 'a', '<Nop>', { buffer = bufnr, noremap = true, silent = true })
    vim.keymap.set('n', 'r', '<Nop>', { buffer = bufnr, noremap = true, silent = true })
    vim.keymap.set('n', 'd', '<Nop>', { buffer = bufnr, noremap = true, silent = true })
    -- Add custom mapping for left arrow to navigate to parent directory and close the tree
    vim.keymap.set('n', '<Left>', function()
      api.node.navigate.parent_close()
    end, { buffer = bufnr, noremap = true, silent = true })
  end,
}

-- load theme
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

require "options"
require "autocmds"

vim.schedule(function()
  require "mappings"
end)
