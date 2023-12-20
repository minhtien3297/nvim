local status_wk, wk = pcall(require, "which-key")
local status_builtin, builtin = pcall(require, "telescope.builtin")

if not status_wk then
  vim.notify('which-key error')
  return
end
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
  ["<C-f>"] = { "magg=<S-g>`a", "Format file" },

  ["<C-g>"] = { function()
    if vim.wo.number then
      vim.wo.number = false
      vim.wo.relativenumber = true
    else
      vim.wo.number = true
      vim.wo.relativenumber = false
    end
  end, "Toggle relativenumber" },

  ["<C-c>"] = { "<Esc>", "Normal Mode", mode = "i" },
  ["<C-y>"] = { [["+y]], "Copy to clipboard", mode = { "n", "v" } },

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

  -- nvim tree
  [";;"] = { "<cmd>NvimTreeToggle<CR>", "Toggle Tree" },

  -- muren
  [";m"] = { "<cmd>MurenToggle<CR>", "Toggle Muren" },

  -- Markdown Preview
  ["<C-e>"] = { "<cmd>MarkdownPreviewToggle<CR>", "Toggle Markdown Preview" },

  -- Obsidian
  ["<leader>o"] = {
    name = "Obsidian",

    o = { "<cmd>ObsidianOpen<CR>", "Open Obsidian", },
    n = { "<cmd>ObsidianNew<CR>", "New note", },
    q = { "<cmd>ObsidianQuickSwitch<CR>", "Search note", },
    b = { "<cmd>ObsidianBacklinks<CR>", "List Back Links", },
    s = { "<cmd>ObsidianSearch<CR>", "Search string", },
  },

  -- lazygit
  ["<leader>f"] = {
    name = "lazygit",

    "<cmd>LazyGit<CR>",
    "LazyGit",
  },

  -- lsp
  ["<leader>l"] = {
    name = "lsp",

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

    s = {
      "<cmd>LspRestart<CR>",
      "Lsp restart"
    }
  },

  -- telescope
  [";"] = {
    name = "telescope",

    f = {
      function()
        builtin.find_files()
      end,
      "Find File",
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

    ["gr"] = {
      function()
        builtin.lsp_references()
      end,
      "Go to references",
    },

    ["gd"] = {
      function()
        builtin.lsp_definitions()
      end,
      "Go to definitions",
    },

    ["di"] = {
      function()
        builtin.diagnostics()
      end,
      "Diagnostics",
    },

    ["gst"] = {
      function()
        builtin.git_status()
      end,
      "Git status",
    },

    ["gco"] = {
      function()
        builtin.git_commits()
      end,
      "Git commit",
    },
  },
})
