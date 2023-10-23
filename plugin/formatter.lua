local status, formatter = pcall(require, "formatter")

if not status then
	return
end

formatter.setup({
	logging = true,
	log_level = vim.log.levels.WARN,

	filetype = {
		lua = {
			require("formatter.filetypes.lua").stylua,
		},

		css = {
			require("formatter.filetypes.css").prettier,
		},

		scss = {
			require("formatter.filetypes.css").prettier,
		},

		html = {
			require("formatter.filetypes.html").prettier,
		},

		javascript = {
			require("formatter.filetypes.javascript").prettier,
		},

		javascriptreact = {
			require("formatter.filetypes.javascriptreact").prettier,
		},

		json = {
			require("formatter.filetypes.json").prettier,
		},

		markdown = {
			require("formatter.filetypes.markdown").prettier,
		},

		sh = {
			require("formatter.filetypes.sh").shfmt,
		},

		toml = {
			require("formatter.filetypes.toml").taplo,
		},

		typescript = {
			require("formatter.filetypes.typescript").prettier,
		},

		typescriptreact = {
			require("formatter.filetypes.typescriptreact").prettier,
		},

		vue = {
			require("formatter.filetypes.vue").prettier,
		},

		xml = {
			require("formatter.filetypes.xml").prettier,
		},

		yaml = {
			require("formatter.filetypes.yaml").prettier,
		},

		-- any filetype
		["*"] = {
			require("formatter.filetypes.any").remove_trailing_whitespace,
		},
	},
})

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
	command = "FormatWriteLock",
})
