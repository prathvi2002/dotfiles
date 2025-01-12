local dap = require "dap"

-- Define the Python debugger adapter
dap.adapters.python = {
  type = "executable",
  command = _G.python_path or "python", -- Path to Python interpreter
  args = { "-m", "debugpy.adapter" },
}

-- Define the debug configuration
dap.configurations.python = {
  {
    type = "python",
    request = "launch",
    name = "Launch file",
    program = "${file}", -- This will debug the currently open file
    pythonPath = _G.python_path or "python", -- Path to Python interpreter
    justMyCode = false, -- Explicitly disable skipping library code
  },
}

local dapui = require "dapui"

vim.fn.sign_define("DapBreakpoint", {
  text = "",
  texthl = "DiagnosticSignError",
  linehl = "",
  numhl = "",
})

vim.fn.sign_define("DapBreakpointRejected", {
  text = "", -- or "❌"
  texthl = "DiagnosticSignError",
  linehl = "",
  numhl = "",
})

vim.fn.sign_define("DapStopped", {
  text = "", -- or "→"
  texthl = "DiagnosticSignWarn",
  linehl = "Visual",
  numhl = "DiagnosticSignWarn",
})

-- DAP UI setup
dapui.setup()

-- Automatically open/close DAP UI
dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end

-- Python Debugging Setup
require("mason-nvim-dap").setup {
  ensure_installed = { "debugpy" },
  automatic_setup = true,
}

-- Define the path to the Python interpreter to be used
local python_path = _G.python_path -- Adjust this as needed for your virtual environment

require("dap-python").setup(python_path, {
  -- justMyCode = false, -- Disable skipping library code
})

-- Debugging Keymaps
vim.keymap.set("n", "<F5>", dap.continue, { desc = "Debug: Start/Continue" })
vim.keymap.set("n", "<F1>", dap.step_into, { desc = "Debug: Step Into" })
vim.keymap.set("n", "<F2>", dap.step_over, { desc = "Debug: Step Over" })
vim.keymap.set("n", "<F3>", dap.step_out, { desc = "Debug: Step Out" })
vim.keymap.set("n", "<leader>d", dap.toggle_breakpoint, { desc = "Debug: Toggle Breakpoint" })
vim.keymap.set("n", "<leader>B", function()
  dap.set_breakpoint(vim.fn.input "Breakpoint condition: ")
end, { desc = "Debug: Set Breakpoint" })
vim.keymap.set("n", "<F6>", function()
  dap.clear_breakpoints()
end, { desc = "Debug: Clear All Breakpoints" })
vim.keymap.set("n", "<F7>", dapui.toggle, { desc = "Debug: Toggle DAP UI" })
--
return {}
