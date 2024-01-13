return {
  "folke/noice.nvim",
  event = "VeryLazy",
  dependencies = {
    "MunifTanjim/nui.nvim",
    "rcarriga/nvim-notify",
  },

  opts = {
    lsp = {
      -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
      override = {
        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
        ["vim.lsp.util.stylize_markdown"] = true,
        ["cmp.entry.get_documentation"] = true,
      },
    },

    views = {
      cmdline_popup = {
        border = {
          style = "none",
          padding = { 1, 1 },
        },

        filter_options = {},

        win_options = {
          winhighlight = "NormalFloat:NormalFloat,FloatBorder:FloatBorder",
        },
      },

      popupmenu = {
        relative = "editor",

        position = {
          row = 24,
          col = "50%",
        },

        size = {
          width = 60,
          height = 10,
        },

        border = {
          style = "none",
          padding = { 1, 1 },
        },

        win_options = {
          winhighlight = "NormalFloat:NormalFloat,FloatBorder:FloatBorder",
        },
      },
    },
  },
}
