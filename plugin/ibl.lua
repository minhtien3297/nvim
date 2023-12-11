local status, ibl = pcall(require, 'ibl')

if not status then
  vim.notify('indent blankline error')
  return
end

ibl.setup()
