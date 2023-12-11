local status_mark, mark = pcall(require, "harpoon.mark")
local status_ui, ui = pcall(require, "harpoon.ui")

if not status_ui then
  vim.notify('harpoon ui error')
  return
end
if not status_mark then
  vim.notify('harpoon mark error')
  return
end

vim.keymap.set("n", "<C-a>", mark.add_file)
vim.keymap.set("n", "<leader>e", ui.toggle_quick_menu)
vim.keymap.set("n", "<C-n>", ui.nav_next)
vim.keymap.set("n", "<C-p>", ui.nav_prev)

vim.keymap.set("n", "<leader>1", function()
  ui.nav_file(1)
end)
vim.keymap.set("n", "<leader>2", function()
  ui.nav_file(2)
end)
vim.keymap.set("n", "<leader>3", function()
  ui.nav_file(3)
end)
vim.keymap.set("n", "<leader>4", function()
  ui.nav_file(4)
end)
