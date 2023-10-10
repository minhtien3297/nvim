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

require("lazy").setup({
    -- theme 
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            vim.cmd([[colorscheme tokyonight-storm]])
        end,
    },

    -- tag highlight
    {
        'nvim-treesitter/nvim-treesitter',
        lazy = true,
        build = ':TSUpdate'
    },

    -- status bar
    {
        'nvim-lualine/lualine.nvim',
    },

    -- find files
    {
        'nvim-telescope/telescope.nvim', tag = '0.1.3',
        -- or                              , branch = '0.1.x',
        dependencies = { 'nvim-lua/plenary.nvim' },
        lazy = true,
    },

    -- file navigation
    {
        'ThePrimeagen/harpoon',
        lazy = true,
    },

    -- file icons
    {
        'nvim-tree/nvim-web-devicons',
        lazy = true,
    },

    -- highlight color
    {
        'norcalli/nvim-colorizer.lua',
        lazy = true,
        opts = {} 
    },

    -- highlight indent
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        lazy = true,
        opts = {} 
    },

    -- auto pairs
    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        lazy = true,
        opts = {} 
    },

    -- git
    {
        'lewis6991/gitsigns.nvim',
        lazy = true,
    },

    -- tmux navigator
    {
        'christoomey/vim-tmux-navigator'
    },

    -- lsp
    {
        --- Uncomment these if you want to manage LSP servers from neovim
        {'williamboman/mason.nvim'},
        {'williamboman/mason-lspconfig.nvim'},

        {'VonHeikemen/lsp-zero.nvim', branch = 'v3.x'},
        {'neovim/nvim-lspconfig'},
        {'hrsh7th/cmp-nvim-lsp'},
        {'hrsh7th/nvim-cmp'},
        {'L3MON4D3/LuaSnip'},
        lazy = true,
    },

    -- which key
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
        end,
        lazy = true,
    },
})
