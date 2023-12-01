local status, session = pcall(require, 'auto-session')

if not status then
    vim.notify('auto-session error')
    return
end

session.setup({
    log_level = 'info',
    auto_session_root_dir = vim.fn.stdpath('data') .. "/sessions/",
    auto_session_enabled = true,
    auto_restore_enabled = true,
    auto_session_use_git_branch = true,
})
