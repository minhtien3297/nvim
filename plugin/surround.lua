local status, surround = pcall(require, 'nvim-surround')

if not status then
  vim.notify('nvim-surround error')
  return
end

surround.setup()
