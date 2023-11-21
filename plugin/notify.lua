local status, notify = pcall(require, "notify")

if not status then
    print('notify error')
    return
end

notify.setup({
    timeout = 1800,

    fps = 60,

    on_open = function(win)
        local buf = vim.api.nvim_win_get_buf(win)
        vim.api.nvim_buf_set_option(buf, "filetype", "markdown")
    end,

    stages = "fade",

    top_down = false,
})

vim.notify = notify
