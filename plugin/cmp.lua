local status_cmp, cmp = pcall(require, "cmp")
local status_vs_snip, vs_snip = pcall(require, "luasnip.loaders.from_vscode")
local status_lsp_kind, lsp_kind = pcall(require, "lspkind")

if not status_lsp_kind then
    return
end
if not status_cmp then
    return
end
if not status_vs_snip then
    return
end

vs_snip.lazy_load()

cmp.setup({
    mapping = cmp.mapping.preset.insert({
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
        ["<Tab>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "s" }),
    }),

    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },

    formatting = {
        fields = { "abbr", "kind", "menu" },
        format = lsp_kind.cmp_format({
            mode = "symbol_text", -- show only symbol annotations
            maxwidth = 50, -- prevent the popup from showing more than provided characters
            ellipsis_char = "...", -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead

            before = function(entry, vim_item)
                return vim_item
            end,
        }),
    },
})
