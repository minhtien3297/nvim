return {
  "okuuva/auto-save.nvim",
  cmd = "ASToggle",                         -- optional for lazy loading on command
  event = { "InsertLeave", "TextChanged" }, -- optional for lazy loading on trigger events

  config = function()
    local as = require("auto-save")

    as.setup({
      execution_message = {
        enabled = true,
        message = function() -- message to print on save
          return ("Saved " .. vim.fn.strftime("%H:%M:%S"))
        end,
        dim = 0.18,               -- dim the color of `message`
        cleaning_interval = 1500, -- (milliseconds) automatically clean MsgArea after displaying `message`. See :h MsgArea
      },
    })

    local group = vim.api.nvim_create_augroup('autosave', {})

    vim.api.nvim_create_autocmd('User', {
      pattern = 'AutoSaveWritePre',
      group = group,

      callback = function(opts)
        if opts.data.saved_buffer ~= nil then
          local clients = vim.lsp.get_active_clients()
          if next(clients) ~= nil then
            vim.lsp.buf.format()
            vim.diagnostic.enable(0)
          end
        end
      end,
    })
  end
}
