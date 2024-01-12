local status, cmt = pcall(require, "Comment")

if not status then
  vim.notify("comment error")
  return
end

cmt.setup()
