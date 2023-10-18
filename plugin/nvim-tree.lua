local status, nvim_tree = pcall(require, 'nvim-tree')
if not status then return end

nvim_tree.setup({
    filters = {
        dotfiles = false,      -- show dot files
        custom = { "^.git$" }, -- hide git folder
        git_ignored = false,   -- show git ignore files
    },
})
