local status, tree_context = pcall(require, 'treesitter-context')
if not status then return end

tree_context.setup({
    mode = 'topline'
})
