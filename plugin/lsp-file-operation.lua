local status, lfo = pcall(require, "lsp-file-operations")

if not status then
  vim.notify("lsp file operations error")
  return
end

lfo.setup()
