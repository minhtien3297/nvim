return {
	"rmagatti/auto-session",

	dependencies = "folke/noice.nvim",

	config = function()
		local as = require("auto-session")

		as.setup({
			log_level = "info",
			auto_session_enabled = true,
			auto_restore_enabled = true,
			auto_session_use_git_branch = true,
			auto_session_enable_last_session = vim.loop.cwd() == vim.loop.os_homedir(),
		})

		vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"
	end,
}
