-- Replace leader default with space
vim.g.mapleader = " "
vim.g.maplocalleader = ' '

-- exit file
vim.keymap.set("n", "<leader>q", vim.cmd.Ex)

-- change position of highlight rows
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- eazier to cut line leftover
vim.keymap.set("n", "J", "mzJ`z")

-- copy to clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])

-- go back to normal mode
vim.keymap.set("i", "<C-c>", "<Esc>")

-- format file and save
vim.keymap.set("n", "<C-f>", vim.lsp.buf.format)

-- source file
vim.keymap.set("n", "<leader><leader>", ":so<CR>", { noremap = true, silent = true })

-- open folder tree
vim.keymap.set("n", "<leader>b", "<cmd>NvimTreeToggle<CR>", { noremap = true, silent = true })

-- quit
vim.keymap.set("n", "<C-q>", "<cmd>q<CR>", { noremap = true, silent = true })
