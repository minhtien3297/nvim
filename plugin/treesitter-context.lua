local status, tree_context = pcall(require, "treesitter-context")

if not status then
  vim.notify('treesitter-context error')
  return
end

tree_context.setup({
  enable = true,
  line_numbers = true,
  mode = "topline",
})
