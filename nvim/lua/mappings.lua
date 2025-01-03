require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

map("n", "<leader>z", "<cmd>ZenMode<cr>", { desc = "Toggle ZenMode" })
map("n", "<leader>s", "<cmd>set modifiable<cr>", { desc = "Modifiable On" })

