vim.opt.guicursor = ""

-- encoding to utf-8
vim.scriptencoding = 'utf-8'
vim.opt.encoding = 'utf-8'
vim.opt.fileencoding = 'utf-8'

-- Display line number and relative line
vim.opt.nu = true
vim.opt.relativenumber = true

-- Indentation default to 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

-- Auto wrap line when it's too long
vim.opt.wrap = false

-- Search include all uppercase and lowercase
vim.o.ignorecase = true
vim.o.smartcase= true

-- Add color to line cursor is in
vim.opt.cursorline = true
vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

-- decrease speed run command
vim.opt.timeoutlen = 250
vim.opt.timeout = true
vim.opt.updatetime = 250

vim.opt.colorcolumn = "80"
