return {
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",

	dependencies = {
		"hrsh7th/cmp-nvim-lsp", -- lsp
		"hrsh7th/cmp-buffer", -- buffer
		"hrsh7th/cmp-path", -- path
		"hrsh7th/cmp-cmdline", -- cmdline
		"hrsh7th/cmp-nvim-lsp-signature-help", -- signature
		"L3MON4D3/LuaSnip", -- snippets engine
		"rafamadriz/friendly-snippets", -- usefule snippets
		"saadparwaiz1/cmp_luasnip", -- snippets
		"onsails/lspkind.nvim",
		"VonHeikemen/lsp-zero.nvim",
	},

	config = function()
		local cmp = require("cmp")
		local lsp_kind = require("lspkind")
		local lsp_zero = require("lsp-zero")

		require("luasnip.loaders.from_vscode").lazy_load()
		lsp_zero.extend_cmp()
		local cmp_action = lsp_zero.cmp_action()

		cmp.setup({
			sources = {
				{ name = "path" },
				{ name = "buffer" },
				{ name = "luasnip" },
				{ name = "nvim_lsp" },
				{ name = "nvim_lsp_signature_help" },
			},

			mapping = cmp.mapping.preset.insert({
				["<CR>"] = cmp.mapping.confirm({ select = true }),
				["<Tab>"] = cmp_action.luasnip_supertab(),
				["<S-Tab>"] = cmp_action.luasnip_shift_supertab(),
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

					before = function(_, vim_item)
						return vim_item
					end,
				}),
			},
		})

		-- `/` cmdline setup.
		cmp.setup.cmdline("/", {
			mapping = cmp.mapping.preset.cmdline(),
			sources = {
				{ name = "buffer" },
			},
		})

		-- `:` cmdline setup.
		cmp.setup.cmdline(":", {
			mapping = cmp.mapping.preset.cmdline(),
			sources = cmp.config.sources({
				{ name = "path" },
			}, {
				{
					name = "cmdline",
					option = {
						ignore_cmds = { "Man", "!" },
					},
				},
			}),
		})
	end,
}
