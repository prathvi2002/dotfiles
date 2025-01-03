-- Set Python path as a global variable
-- _G.python_path = "/home/ishu/virtualenvs/django-venv/bin/python" -- Replace with your desired path
_G.python_path = "/usr/bin/python" -- Replace with your desired path

vim.g.base46_cache = vim.fn.stdpath "data" .. "/base46/"
vim.g.mapleader = " "

-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end

vim.opt.rtp:prepend(lazypath)

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

-- load theme
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

require "options"
require "nvchad.autocmds"

vim.schedule(function()
  require "mappings"
end)

-- Automatically sets the filetype to "htmldjango" for .html files in any "templates" folder, including deeply nested subdirectories.
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = "*/templates/*.html",
  callback = function()
    vim.bo.filetype = "htmldjango"
  end,
})


