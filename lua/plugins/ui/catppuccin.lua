return {
  "catppuccin/nvim",
  name = "catppuccin",
  lazy = false,
  priority = 1000,

  init = function()
    vim.cmd.colorscheme "catppuccin"
  end,

  opts = {
    flavour = "mocha", -- latte, frappe, macchiato, mocha

    dim_inactive = {
      enabled = true,   -- dims the background color of inactive window
      shade = "dark",
      percentage = 0.5, -- percentage of the shade to apply to the inactive window
    },

    integrations = {
      cmp = true,
      harpoon = true,
      markdown = true,
      ufo = true,
      telescope = true,
      which_key = true,
      nvimtree = true,
      treesitter = true,
      treesitter_context = true,
      notify = true,
      mason = true,
      noice = true,

      indent_blankline = {
        enabled = true,
        scope_color = "", -- catppuccin color (eg. `lavender`) Default: text
        colored_indent_levels = true,
      },

      native_lsp = {
        enabled = true,

        virtual_text = {
          errors = { "italic" },
          hints = { "italic" },
          warnings = { "italic" },
          information = { "italic" },
        },

        underlines = {
          errors = { "underline" },
          hints = { "underline" },
          warnings = { "underline" },
          information = { "underline" },
        },

        inlay_hints = { background = true, },
      },
    },
  },
}
