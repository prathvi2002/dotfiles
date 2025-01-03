-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"

-- EXAMPLE
local servers = { "html", "cssls", "lua_ls" }
local nvlsp = require "nvchad.configs.lspconfig"

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }
end

-- configuring single server, example: typescript
-- lspconfig.ts_ls.setup {
--   on_attach = nvlsp.on_attach,
--   on_init = nvlsp.on_init,
--   capabilities = nvlsp.capabilities,
-- }

-- Define the path to the Python interpreter to be used
local python_path = _G.python_path -- Adjust this as needed for your virtual environment

-- Configure Pylsp Language Server
lspconfig.pylsp.setup {
  on_attach = nvlsp.on_attach, -- Function to run when the LSP attaches to a buffer
  on_init = nvlsp.on_init, -- Function to run when the LSP initializes
  capabilities = nvlsp.capabilities, -- Define client capabilities (e.g., for completion, hover, etc.)
  cmd = { python_path, "-m", "pylsp" }, -- Command to start the Pylsp server with the specified Python interpreter

  settings = {
    pylsp = {
      plugins = {
        -- Disable plugins that provide additional features or tools
        rope_completion = { enabled = false }, -- Disable Rope for completions and renaming
        pyflakes = { enabled = false }, -- Disable Pyflakes linter
        mccabe = { enabled = false }, -- Disable McCabe linter for complexity checking
        pycodestyle = { enabled = false }, -- Disable pycodestyle for style checking
        pydocstyle = { enabled = false }, -- Disable pydocstyle for docstring style checking
        autopep8 = { enabled = false }, -- Disable autopep8 for code formatting
        yapf = { enabled = false }, -- Disable YAPF for code formatting
        flake8 = { enabled = false }, -- Disable flake8 for error checking
        pylint = { enabled = false }, -- Disable pylint for linting (can be enabled as needed)
      },
    },
  },
}

lspconfig.djlsp.setup {
  on_attach = nvlsp.on_attach,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
  init_options = {
    djlsp = {
      django_settings_module = "<project_folder_name(not path)>.settings",
    },
  },
}
