return {
	"christoomey/vim-tmux-navigator",
	event = "VeryLazy",

	init = function()
		vim.api.nvim_set_keymap("n", "{Left-Mapping}", ":lua TmuxNavigateLeft()<CR>", { silent = true })
		vim.api.nvim_set_keymap("n", "{Down-Mapping}", ":lua TmuxNavigateDown()<CR>", { silent = true })
		vim.api.nvim_set_keymap("n", "{Up-Mapping}", ":lua TmuxNavigateUp()<CR>", { silent = true })
		vim.api.nvim_set_keymap("n", "{Right-Mapping}", ":lua TmuxNavigateRight()<CR>", { silent = true })
		vim.api.nvim_set_keymap("n", "{Previous-Mapping}", ":lua TmuxNavigatePrevious()<CR>", { silent = true })
	end,
}
