require('nvim-tree').setup({
    filters = {
        dotfiles = false,      -- show dot files
        custom = { "^.git$" }, -- hide git folder
        git_ignored = false,   -- show git ignore files
    },
})
