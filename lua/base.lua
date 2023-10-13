vim.opt.guicursor = ""

-- Replace leader default with space
vim.g.mapleader = " "
vim.g.maplocalleader = ' '

-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

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
vim.opt.wrap = true

-- Search include all uppercase and lowercase
vim.o.ignorecase = true
vim.o.smartcase = true

-- Add color to line cursor is in
vim.opt.cursorline = false

-- Display theme color
vim.opt.termguicolors = true

-- decrease speed run command
vim.opt.timeoutlen = 250
vim.opt.timeout = true
vim.opt.updatetime = 250

-- show collumn right hand
vim.opt.colorcolumn = "0"
