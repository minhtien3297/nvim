local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup(
    {
        -- theme
        {
            "folke/tokyonight.nvim",
            priority = 1000,
            lazy = false,
            config = function()
                vim.cmd([[colorscheme tokyonight]])
            end,
        },

        -- tag highlight
        {
            'nvim-treesitter/nvim-treesitter',
            build = ':TSUpdate'
        },

        -- status bar
        {
            'nvim-lualine/lualine.nvim',
        },

        -- find files
        {
            'nvim-telescope/telescope.nvim',
            tag = '0.1.3',
            -- or                              , branch = '0.1.x',
            dependencies = { 'nvim-lua/plenary.nvim' },
        },

        -- autosave
        {
            "okuuva/auto-save.nvim",
            cmd = "ASToggle",
            event = { "InsertLeave", "TextChanged" },
            opts = {},
        },

        -- noti
        {
            'rcarriga/nvim-notify',
            config = function()
                vim.notify = require('notify')
            end
        },

        -- file navigation
        {
            'ThePrimeagen/harpoon',
        },

        -- file icons
        {
            'nvim-tree/nvim-web-devicons',
        },

        -- highlight color
        {
            'norcalli/nvim-colorizer.lua',
        },

        -- highlight indent
        {
            "lukas-reineke/indent-blankline.nvim",
            main = "ibl",
            opts = {},
        },

        -- auto pairs
        {
            'windwp/nvim-autopairs',
            event = "InsertEnter",
            opts = {},
        },

        -- smooth scroll
        {
            'karb94/neoscroll.nvim'
        },

        -- Comment
        {
            'numToStr/Comment.nvim',
            opts = {},
            lazy = false,
        },

        -- highlight todo
        {
            "folke/todo-comments.nvim",
            dependencies = { "nvim-lua/plenary.nvim" },
            opts = {}
        },

        -- git
        {
            'lewis6991/gitsigns.nvim',
        },

        -- tmux navigator
        {
            'christoomey/vim-tmux-navigator',
        },

        -- editor configs
        {
            'editorconfig/editorconfig-vim',
        },

        -- command lsp
        {
            'gelguy/wilder.nvim',
        },

        -- lsp
        {
            { 'williamboman/mason.nvim' },
            { 'williamboman/mason-lspconfig.nvim' },

            { 'VonHeikemen/lsp-zero.nvim',        branch = 'v3.x' },
            { 'neovim/nvim-lspconfig' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'hrsh7th/nvim-cmp' },
            { 'L3MON4D3/LuaSnip' },
        },

        -- which key
        {
            "folke/which-key.nvim",
            event = "VeryLazy",
            init = function()
                vim.o.timeout = true
                vim.o.timeoutlen = 300
            end,
        },
    }
)
