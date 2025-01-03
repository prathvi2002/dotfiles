return {

  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = "all",
    },
  },

  -- {
  --   "microsoft/python-type-stubs",
  -- },

  {
    "lukas-reineke/indent-blankline.nvim",
    enabled = false,
  },

  {
    "shellRaining/hlchunk.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("hlchunk").setup {
        chunk = {
          enable = true,
          -- ...
        },
        indent = {
          enable = true,
          -- ...
        },
      }
    end,
  },

  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "rcarriga/nvim-dap-ui",
      "jay-babu/mason-nvim-dap.nvim",
      "mfussenegger/nvim-dap-python",
      "nvim-neotest/nvim-nio",
    },
    config = function()
      require "configs.pythondebug"
    end,
  },

  {
    "folke/zen-mode.nvim",
  },

  {
    "nvimtools/none-ls.nvim",
    config = function()
      local none_ls = require "null-ls"

      -- local python_path = "/home/ishu/virtualenvs/django-venv/bin/python" -- Adjust this as needed for your virtual environment

      -- Configure none-ls
      none_ls.setup {
        sources = {
          none_ls.builtins.diagnostics.mypy.with {
            -- you can find the extra_args that can be used with mypy by typing "mypy --help" in terminal
            extra_args = {
              "--ignore-missing-imports",
              "--show-column-numbers",
              "--python-executable=" .. _G.python_path, -- Set your Python interpreter
            },
          },
        },
      }
    end,
  },
}
