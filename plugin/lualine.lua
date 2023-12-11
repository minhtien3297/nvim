local status, lualine = pcall(require, "lualine")
local status_session, session = pcall(require, 'auto-session.lib')

if not status_session then
  vim.notify('auto-session error')
  return
end

if not status then
  vim.notify('lualine error')
  return
end

lualine.setup({
  options = {
    icons_enabled = true,
    theme = "catppuccin",
    component_separators = " ",
    section_separators = "",
  },

  sections = {
    lualine_b = {
      "branch",
      "diff",
    },

    lualine_c = {
      {
        "filename",
        file_status = true,
        path = 1,
        symbols = {
          modified = "modified",       -- Text to show when the file is modified.
          readonly = "readonly",       -- Text to show when the file is non-modifiable or readonly.
          unnamed = "unnamed buffers", -- Text to show for unnamed buffers.
          newfile = "newfile",         -- Text to show for newly created file before first write
        },
      },

      {
        "diagnostics",
        symbols = {
          error = "✘ ",
          warn = "▲ ",
          hint = "⚑ ",
          info = "» ",
        },
        colored = true,
        update_in_insert = true,
        always_visible = false,
      },

      {
        function()
          if not session.current_session_name then
            return 'No Session'
          end

          return session.current_session_name()
        end,
        color = { fg = "#ffffff", gui = "bold" },
      }
    },

    lualine_x = {
      {
        function()
          local msg = "No Active Lsp"
          local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
          local clients = vim.lsp.get_active_clients()
          if next(clients) == nil then
            return msg
          end
          for _, client in ipairs(clients) do
            local filetypes = client.config.filetypes
            if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
              return client.name
            end
          end
          return msg
        end,
        icon = " LSP:",
        color = { fg = "#ffffff", gui = "bold" },
      },

      "encoding",

      {
        "filetype",
        colored = true,
      },
    },
  },
})
