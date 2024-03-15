return {
  "kdheepak/lazygit.nvim",
  cmd = {
    "LazyGit",
    "LazyGitConfig",
    "LazyGitCurrentFile",
    "LazyGitFilter",
    "LazyGitFilterCurrentFile",
  },
  dependencies = { "nvim-lua/plenary.nvim", },

  config = function()
    vim.g.lazygit_floating_window_scaling_factor = 1
    vim.g.lazygit_floating_window_use_plenary = 1
  end
}
