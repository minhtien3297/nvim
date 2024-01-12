local status_cmp, cmp = pcall(require, "cmp")
local status_lsp_zero, lsp_zero = pcall(require, "lsp-zero")
local status_vs_snip, vs_snip = pcall(require, "luasnip.loaders.from_vscode")
local status_lsp_kind, lsp_kind = pcall(require, "lspkind")

if not status_lsp_zero then
  vim.notify('lsp-zero error')
  return
end
if not status_lsp_kind then
  vim.notify('lsp-kind error')
  return
end
if not status_cmp then
  vim.notify('cmp error')
  return
end
if not status_vs_snip then
  vim.notify('vs_snip error')
  return
end

vs_snip.lazy_load()

local cmp_action = lsp_zero.cmp_action()

cmp.setup({
  mapping = cmp.mapping.preset.insert({
    ["<CR>"] = cmp.mapping.confirm({ select = true }),
    ['<Tab>'] = cmp_action.luasnip_supertab(),
    ['<S-Tab>'] = cmp_action.luasnip_shift_supertab(),
  }),

  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },

  formatting = {
    fields = { "abbr", "kind", "menu" },
    format = lsp_kind.cmp_format({
      mode = "symbol_text",  -- show only symbol annotations
      maxwidth = 50,         -- prevent the popup from showing more than provided characters
      ellipsis_char = "...", -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead

      before = function(_, vim_item)
        return vim_item
      end,
    }),
  },
})
