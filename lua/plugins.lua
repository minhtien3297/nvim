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
  { "catppuccin/nvim",                         name = "catppuccin", priority = 1000, }, -- theme

  { "stevearc/dressing.nvim",                  event = "VeryLazy", },                   -- ui input and select

  { "nvim-treesitter/nvim-treesitter",         build = ":TSUpdate", },                  -- tag highlight

  { "nvim-treesitter/nvim-treesitter-context", },                                       -- sticky scroll

  { "nvim-lualine/lualine.nvim", },                                                     -- status bar

  -- telescope
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.4",
    dependencies = { "nvim-lua/plenary.nvim", "tsakirist/telescope-lazy.nvim", "nvim-lua/popup.nvim", "nvim-telescope/telescope-media-files.nvim" },
  },

  { "rcarriga/nvim-notify", },                                                                                -- noti

  { "karb94/neoscroll.nvim", },                                                                               -- smooth scroll

  { "ThePrimeagen/harpoon",                branch = "harpoon2", dependencies = { "nvim-lua/plenary.nvim" } }, -- file navigation

  { "nvim-tree/nvim-web-devicons", },                                                                         -- file icons

  { "norcalli/nvim-colorizer.lua", },                                                                         -- highlight color

  { "lukas-reineke/indent-blankline.nvim", main = "ibl", },                                                   -- highlight indent

  -- fold manager
  {
    "kevinhwang91/nvim-ufo",
    dependencies = { "kevinhwang91/promise-async", "luukvbaal/statuscol.nvim", },
  },

  { "windwp/nvim-autopairs",  event = "InsertEnter", }, -- auto pairs

  { "windwp/nvim-ts-autotag", },                        -- auto tag

  { "numToStr/Comment.nvim",  lazy = false, },          -- Comment

  -- markdown preview
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop", },
    ft = "markdown",
    build = function()
      vim.fn["mkdp#util#install"]()
    end,
  },

  -- leetcode
  {
    "kawre/leetcode.nvim",
    build = ":TSUpdate html",
    lazy = "leetcode.nvim" ~= vim.fn.argv()[1],
    opts = { arg = "leetcode.nvim", },
    dependencies = {
      "nvim-telescope/telescope.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-treesitter/nvim-treesitter",
      "rcarriga/nvim-notify",
      "nvim-tree/nvim-web-devicons",
    },
  },

  { "folke/todo-comments.nvim",       dependencies = { "nvim-lua/plenary.nvim" }, },  -- highlight todo

  { "wintermute-cell/gitignore.nvim", },                                              -- git ignore

  { 'f-person/git-blame.nvim', },                                                     -- git blame line

  { "kdheepak/lazygit.nvim",          dependencies = { "nvim-lua/plenary.nvim", }, }, -- lazygit

  { 'rmagatti/auto-session', },                                                       -- nvim session

  { "editorconfig/editorconfig-vim", },                                               -- editor configs

  { "gelguy/wilder.nvim", },                                                          -- command lsp

  -- folder tree
  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    dependencies = { "nvim-tree/nvim-web-devicons", },
  },

  -- update file import after file change
  {
    "antosha417/nvim-lsp-file-operations",
    dependencies = { "nvim-lua/plenary.nvim", "nvim-tree/nvim-tree.lua", },
  },

  { "kylechui/nvim-surround",    version = "*",                             event = "VeryLazy", }, -- vim surround

  -- obsidian
  {
    "epwalsh/obsidian.nvim",
    version = "*", -- recommended, use latest release instead of latest commit
    lazy = true,
    ft = "markdown",
    dependencies = { "nvim-lua/plenary.nvim", },
  },

  { "nvim-focus/focus.nvim",     version = '*' },                              -- auto focus pane

  { "kevinhwang91/nvim-hlslens", },                                            -- hightlight searching pattern

  { 'mg979/vim-visual-multi' },                                                -- multi text choosen

  { "AckslD/muren.nvim",         config = true, },                             -- search and replace

  { "vuki656/package-info.nvim", dependencies = { "MunifTanjim/nui.nvim" }, }, -- show outdated package

  -- auto save
  {
    "okuuva/auto-save.nvim",
    cmd = "ASToggle",
    event = { "InsertLeave", "TextChanged", "BufLeave", "FocusLost" },
    opts = {},
  },

  { 'christoomey/vim-tmux-navigator' }, -- tmux navigation

  -- lsp
  { "williamboman/mason.nvim" },
  { "williamboman/mason-lspconfig.nvim" },
  { "neovim/nvim-lspconfig" },
  { "VonHeikemen/lsp-zero.nvim",        branch = "v3.x" },
  { "onsails/lspkind.nvim" },
  { "lukas-reineke/lsp-format.nvim" },

  -- cmp
  { "hrsh7th/cmp-nvim-lsp" },
  { "hrsh7th/nvim-cmp" },
  { "L3MON4D3/LuaSnip",                 dependencies = { "rafamadriz/friendly-snippets" }, },

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
