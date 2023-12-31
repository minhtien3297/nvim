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
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
  },

  -- ui input and select
  {
    "stevearc/dressing.nvim",
    event = "VeryLazy",
    opts = {},
  },

  -- tag highlight
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
  },

  -- sticky scroll
  { "nvim-treesitter/nvim-treesitter-context", },

  -- status bar
  { "nvim-lualine/lualine.nvim", },

  -- telescope
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.4",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "tsakirist/telescope-lazy.nvim",
      "nvim-lua/popup.nvim",
      "nvim-telescope/telescope-media-files.nvim"
    },
  },

  -- noti
  { "rcarriga/nvim-notify", },

  -- smooth scroll
  { "karb94/neoscroll.nvim", },

  -- file navigation
  { "ThePrimeagen/harpoon", },

  -- file icons
  { "nvim-tree/nvim-web-devicons", },

  -- highlight color
  { "norcalli/nvim-colorizer.lua", },

  -- highlight indent
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {},
  },

  -- fold manager
  {
    "kevinhwang91/nvim-ufo",
    dependencies = {
      "kevinhwang91/promise-async",
      "luukvbaal/statuscol.nvim",
    },
  },

  -- auto pairs
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = {},
  },

  -- auto tag
  {
    "windwp/nvim-ts-autotag",
  },

  -- Comment
  {
    "numToStr/Comment.nvim",
    opts = {},
  },

  -- Hard time
  {
    "m4xshen/hardtime.nvim",
    dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
    opts = {},
  },

  -- markdown preview
  {
    "iamcco/markdown-preview.nvim",
    cmd = {
      "MarkdownPreviewToggle",
      "MarkdownPreview",
      "MarkdownPreviewStop",
    },
    ft = { "markdown" },
    build = function()
      vim.fn["mkdp#util#install"]()
    end,
  },

  -- leetcode
  {
    "Dhanus3133/LeetBuddy.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
    },
  },

  -- highlight todo
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {},
  },

  -- git ignore
  { "wintermute-cell/gitignore.nvim", },

  -- git blame line
  { 'f-person/git-blame.nvim', },

  -- lazygit
  {
    "kdheepak/lazygit.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },

  -- nvim session
  { 'rmagatti/auto-session', },

  -- editor configs
  { "editorconfig/editorconfig-vim", },

  -- command lsp
  { "gelguy/wilder.nvim", },

  -- folder tree
  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
  },

  -- lsp nvim tree
  {
    "antosha417/nvim-lsp-file-operations",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-tree.lua",
    },
  },

  -- vim surround
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
  },

  -- obsidian
  {
    "epwalsh/obsidian.nvim",
    version = "*", -- recommended, use latest release instead of latest commit
    lazy = true,
    ft = "markdown",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },

  -- auto focus pane
  {
    "nvim-focus/focus.nvim",
    version = '*'
  },

  -- hightlight searching pattern
  { "kevinhwang91/nvim-hlslens", },

  -- search and replace
  {
    "AckslD/muren.nvim",
    config = true,
  },

  -- show outdated package
  {
    "vuki656/package-info.nvim",
    dependencies = { "MunifTanjim/nui.nvim" },
  },

  -- auto save
  {
    "okuuva/auto-save.nvim",
    cmd = "ASToggle",
    event = { "InsertLeave", "TextChanged", "BufLeave", "FocusLost" },
    opts = {},
  },

  -- tmux navigation
  { 'christoomey/vim-tmux-navigator' },

  -- lsp
  {
    { "williamboman/mason.nvim" },
    { "williamboman/mason-lspconfig.nvim" },

    { "neovim/nvim-lspconfig" },
    { "VonHeikemen/lsp-zero.nvim",        branch = "v3.x" },
    { "onsails/lspkind.nvim" },
    { "lukas-reineke/lsp-format.nvim" },
  },

  -- cmp
  {

    { "hrsh7th/cmp-nvim-lsp" },
    { "hrsh7th/nvim-cmp" },
    {
      "L3MON4D3/LuaSnip",
      dependencies = { "rafamadriz/friendly-snippets" },
    },
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
})
