local status_lsp_zero, lsp_zero = pcall(require, "lsp-zero")
local status_lsp_format, lsp_format = pcall(require, "lsp-format")
local status_mason, mason = pcall(require, "mason")
local status_mason_lspconfig, mason_lspconfig = pcall(require, "mason-lspconfig")

if not status_lsp_zero then
  vim.notify('lsp_zero error')
  return
end
if not status_lsp_format then
  vim.notify('lsp_format error')
  return
end
if not status_mason then
  vim.notify('mason error')
  return
end
if not status_mason_lspconfig then
  vim.notify('mason_lspconfig error')
  return
end

lsp_zero.on_attach(function(client, bufnr)
  lsp_zero.default_keymaps({ buffer = bufnr })

  -- make sure you use clients with formatting capabilities
  -- otherwise you'll get a warning message
  if client.supports_method('textDocument/formatting') then
    lsp_format.on_attach(client)
  end
end)

lsp_zero.set_sign_icons({
  error = " ✘",
  warn = " ▲",
  hint = " ⚑",
  info = " »",
})

mason.setup({
  ui = {
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗",
    },
  },
})

local servers = {
  "lua_ls",
  "bashls",
  "hydra_lsp",
  "html",
  "cssls",
  "volar",
  "tsserver",
  "jsonls",
  "taplo",
}

mason_lspconfig.setup({
  ensure_installed = servers,
  automatic_installation = true,

  handlers = {
    lsp_zero.default_setup,
  },
})
