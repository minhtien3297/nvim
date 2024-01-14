return {
  "epwalsh/obsidian.nvim",
  ft = "markdown",

  dependencies = {
    "nvim-lua/plenary.nvim",
    "hrsh7th/nvim-cmp",
    "nvim-telescope/telescope.nvim",
    "nvim-treesitter/nvim-treesitter"
  },

  opts = {
    dir = "~/Obsidian/knowledge-vault",

    notes_subdir = "Inbox",

    -- Optional, completion.
    completion = {
      new_notes_location = "notes_subdir",
    },

    -- Optional, customize how names/IDs for new notes are created.
    note_id_func = function(title)
      local suffix = ""
      if title ~= nil then
        -- If title is given, transform it into valid file name.
        suffix = title
      else
        suffix = suffix .. vim.fn.strftime("%c")
      end
      return suffix
    end,
  }
}
