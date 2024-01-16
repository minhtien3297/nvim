return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 200
  end,

  config = function()
    local wk = require("which-key")
    local status_builtin, builtin = pcall(require, "telescope.builtin")

    if not status_builtin then
      vim.notify('telescope.builtin error')
      return
    end

    wk.setup({
      ignore_missing = true,
    })

    wk.register({
      -- remap
      ["<leader><space>"] = { ":so<CR>", "Source file" },
      ["<C-q>"] = { "<cmd>q<CR>", "Exit file" },
      ["<S-l>"] = { "<cmd>noh<CR>", "Clear search", noremap = true, silent = true },
      ["<C-f>"] = { "magg=<S-g>`a<cmd>:wa<CR>", "Format file", mode = "n" },

      ["<C-g>"] = {
        function()
          if vim.wo.number then
            vim.wo.number = false
            vim.wo.relativenumber = true
          else
            vim.wo.number = true
            vim.wo.relativenumber = false
          end
        end, "Toggle relative number"
      },

      ["<C-y>"] = { '"+y', "Copy to clipboard", mode = { "n", "v" } },

      J = {
        { "mzJ`z",            "Cut line eazier",     mode = "n" },
        { ":m '>+1<CR>gv=gv", "Highlight rows down", mode = "v" },
      },

      K = {
        {
          function()
            vim.lsp.buf.hover()
          end,
          "Hover code"
        },
        {
          ":m '<-2<CR>gv=gv",
          "Highlight rows up",
          mode = "v"
        }
      },

      -- Markdown Preview
      ["<C-e>"] = { "<cmd>MarkdownPreviewToggle<CR>", "Toggle Markdown Preview" },

      ["<leader>"] = {
        -- lsp
        o = {
          function()
            vim.diagnostic.open_float()
          end,
          "Show diagnostic of word under",
        },

        c = {
          function()
            vim.lsp.buf.code_action()
          end,
          "Code action",
        },

        r = {
          function()
            vim.lsp.buf.rename()
          end,
          "Rename all references",
        },

        s = { "<cmd>LspRestart<CR>", "Lsp restart" },

        -- Obsidian
        m = { "<cmd>ObsidianOpen<CR>", "Open Obsidian", },
        n = { "<cmd>ObsidianNew<CR>", "New note", },
        t = { "<cmd>ObsidianBacklinks<CR>", "List Back Links", },
        i = { "<cmd>ObsidianPasteImg<CR>", "Paste Img", },

        -- lazygit
        f = { "<cmd>LazyGit<CR>", "LazyGit", },
      },

      [";"] = {
        -- nvim tree
        [";"] = { "<cmd>NvimTreeToggle<CR>", "Toggle Tree" },

        -- muren
        m = { "<cmd>MurenToggle<CR>", "Toggle Muren" },

        -- telescope
        f = {
          function()
            builtin.find_files()
          end,
          "Find File",
        },

        b = {
          function()
            builtin.buffers()
          end,
          "Find Buffers",
        },

        g = {
          function()
            builtin.live_grep()
          end,
          "Search String",
        },

        c = {
          function()
            builtin.commands()
          end,
          "Search Commands",
        },

        h = {
          function()
            builtin.help_tags()
          end,
          "Search Help",
        },

        l = {
          function()
            vim.cmd.Telescope "lazy"
          end,
          "Search Lazy plugins",
        },

        t = {
          function()
            vim.cmd.TodoTelescope()
          end,
          "Search Todo",
        },

        n = {
          function()
            vim.cmd.Telescope "notify"
          end,
          "Search Notifications",
        },

        r = {
          function()
            builtin.registers()
          end,
          "Search registers",
        },

        k = {
          function()
            builtin.keymaps()
          end,
          "Search keymaps",
        },

        i = {
          function()
            vim.cmd.Telescope "media_files"
          end,
          "Search media files",
        },

        u = {
          function()
            builtin.lsp_references()
          end,
          "Go to references",
        },

        q = {
          function()
            builtin.lsp_definitions()
          end,
          "Go to definitions",
        },

        d = {
          function()
            builtin.diagnostics()
          end,
          "Diagnostics",
        },
      },
    })
  end
}
