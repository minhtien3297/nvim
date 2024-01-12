local status, harpoon = pcall(require, "harpoon")

if not status then
  vim.notify("harpoon error")
  return
end

harpoon:setup()

local toggle_menu = function()
  harpoon.ui:toggle_quick_menu(harpoon:list())
end

local list_append = function()
  harpoon:list():append()
  vim.notify("File added to Harpoon")
end

harpoon:extend({
  UI_CREATE = function(cx)
    vim.keymap.set("n", "<S-l>", function()
      harpoon.ui:select_menu_item({ vsplit = true })
    end, { buffer = cx.bufnr })

    vim.keymap.set("n", "l", function()
      harpoon.ui:select_menu_item()
    end, { buffer = cx.bufnr })
  end,
})

vim.keymap.set("n", "<leader>a", list_append)
vim.keymap.set("n", "<leader>e", toggle_menu)
