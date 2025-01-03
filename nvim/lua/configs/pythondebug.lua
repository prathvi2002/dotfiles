local dap = require "dap"
local dapui = require "dapui"

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

require("dap-python").setup "/usr/bin/python" -- Update the Python path as needed

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

return {}
