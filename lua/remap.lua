-- Replace leader default with space
vim.g.mapleader = " "
vim.g.maplocalleader = ' '

-- exit file
vim.keymap.set("n", "<leader>q", vim.cmd.Ex)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- eazier to cut line leftover
vim.keymap.set("n", "J", "mzJ`z")

-- greatest remap ever
-- vimim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
-- vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
-- vim.keymap.set("n", "<leader>Y", [["+Y]])

-- vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])

-- format file and save
vim.keymap.set("n", "<C-f>", "ggVG=:w<CR>", { noremap = true, silent = true })

-- go back to normal mode
vim.keymap.set("i", "<C-c>", "<Esc>")

-- vim.keymap.set("n", "", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

-- source file
vim.keymap.set("n", "<leader><leader>", ":so<CR>", { noremap = true, silent = true })

-- open folder tree
vim.keymap.set("n", "<leader>b", "<cmd>NvimTreeToggle<CR>", { noremap = true, silent = true })
