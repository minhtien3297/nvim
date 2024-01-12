local status, todo = pcall(require, "todo-comments")

if not status then
  vim.notify("todo-comment error")
  return
end

todo.setup()
