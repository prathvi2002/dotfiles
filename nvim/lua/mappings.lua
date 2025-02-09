require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

map("n", "<leader>z", "<cmd>ZenMode<cr>", { desc = "Toggle ZenMode" })
map("n", "<leader>m", "<cmd>set modifiable<cr>", { desc = "Modifiable On" })

map("n", "<leader>dlo", "<cmd>DebugWithLibrariesOn<cr>", { desc = "Debug: With Libraries On" })
map("n", "<leader>dlf", "<cmd>DebugWithLibrariesOff<cr>", { desc = "Debug: With Libraries Off" })

-- Keybinding to toggle relative and absolute line numbers (compatible with Python breakpoints)
vim.api.nvim_set_keymap('n', '<leader>rr', ':lua ToggleLineNumbers()<CR>', { noremap = true, silent = true })
