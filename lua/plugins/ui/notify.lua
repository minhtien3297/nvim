return {
  "rcarriga/nvim-notify",

  config = function()
    local notify = require("notify")


    notify.setup({
      timeout = 1800,

      fps = 60,

      render = "wrapped-compact",

      on_open = function(win)
        local buf = vim.api.nvim_win_get_buf(win)
        vim.api.nvim_buf_set_option(buf, "filetype", "markdown")
      end,

      stages = "fade",

      top_down = false,
    })

    vim.notify = notify
  end
}
