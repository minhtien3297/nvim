return {
  'rmagatti/auto-session',

  opts = {
    log_level = 'info',
    auto_session_root_dir = vim.fn.stdpath('data') .. "/sessions/",
    auto_session_enabled = true,
    auto_restore_enabled = true,
    auto_session_use_git_branch = true,
  }
}
