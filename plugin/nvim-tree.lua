local HEIGHT_RATIO = 0.8 -- You can change this
local WIDTH_RATIO = 0.5  -- You can change this too

require('nvim-tree').setup({
    filters = {
        dotfiles = false,      -- show dot files
        custom = { "^.git$" }, -- hide git folder
        git_ignored = false,   -- show git ignore files
    },
})
