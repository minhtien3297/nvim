local status_lsp_zero, lsp_zero = pcall(require, "lsp-zero")
local status_mason, mason = pcall(require, "mason")
local status_mason_lspconfig, mason_lspconfig = pcall(require, "mason-lspconfig")
local status_cmp, cmp = pcall(require, "cmp")
local status_lsp_kind, lsp_kind = pcall(require, "lspkind")
local status_vs_snip, vs_snip = pcall(require, "luasnip.loaders.from_vscode")

if not status_cmp then
	return
end
if not status_lsp_kind then
	return
end
if not status_lsp_zero then
	return
end
if not status_mason then
	return
end
if not status_mason_lspconfig then
	return
end
if not status_vs_snip then
	return
end

lsp_zero.on_attach(function(client, bufnr)
	-- see :help lsp-zero-keybindings
	-- to learn the available actions
	lsp_zero.default_keymaps({ buffer = bufnr })
end)

vs_snip.lazy_load()

mason.setup({})
mason_lspconfig.setup({
	ensure_installed = {
		"tailwindcss",
		"volar",
		"grammarly",
		"stylelint_lsp",
		"lua_ls",
		"cssls",
		"eslint",
		"html",
		"jsonls",
		"tsserver",
		"taplo",
		"stylua",
		"prettier",
		"shfmt",
	},

	automatic_installation = true,

	handlers = {
		lsp_zero.default_setup,
	},
})

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
