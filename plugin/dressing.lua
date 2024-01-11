local status, dress = pcall(require, "dressing")

if not status then
  vim.notify("dressing erro")
  return
end

dress.setup({
  input = {
    title_pos = "center",
    relative = "editor",
  }
})
