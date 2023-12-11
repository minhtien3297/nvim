local status, telescope = pcall(require, 'telescope')
local status_preview, telescope_preview = pcall(require, 'telescope.previewers.utils')

if not status then
  vim.notify('telescope error')
  return
end

if not status_preview then
  vim.notify('telescope.previewers.utils error')
  return
end

telescope.setup {
  defaults = {
    preview = {
      mime_hook = function(filepath, bufnr, opts)
        local is_image = function(filepath)
          local image_extensions = { 'png', 'jpg', 'gif' } -- Supported image formats
          local split_path = vim.split(filepath:lower(), '.', { plain = true })
          local extension = split_path[#split_path]
          return vim.tbl_contains(image_extensions, extension)
        end
        if is_image(filepath) then
          local term = vim.api.nvim_open_term(bufnr, {})
          local function send_output(_, data, _)
            for _, d in ipairs(data) do
              vim.api.nvim_chan_send(term, d .. '\r\n')
            end
          end
          vim.fn.jobstart(
            {
              'catimg', filepath -- Terminal image viewer command
            },
            { on_stdout = send_output, stdout_buffered = true, pty = true })
        else
          telescope_preview.set_preview_message(bufnr, opts.winid,
            "Binary cannot be previewed")
        end
      end
    },
  },

  extensions = {
    lazy = {
      -- Optional theme (the extension doesn't set a default theme)
      theme = "ivy",
      -- Whether or not to show the icon in the first column
      show_icon = true,
      -- Mappings for the actions
      mappings = {
        open_in_browser = "<C-o>",
        open_in_file_browser = "<M-b>",
        open_in_find_files = "<C-f>",
        open_in_live_grep = "<C-g>",
        open_in_terminal = "<C-t>",
        open_plugins_picker = "<C-b>", -- Works only after having called first another action
        open_lazy_root_find_files = "<C-r>f",
        open_lazy_root_live_grep = "<C-r>g",
        change_cwd_to_plugin = "<C-c>d",
      },
      -- Configuration that will be passed to the window that hosts the terminal
      -- For more configuration options check 'nvim_open_win()'
      terminal_opts = {
        relative = "editor",
        style = "minimal",
        border = "rounded",
        title = "Telescope lazy",
        title_pos = "center",
        width = 0.5,
        height = 0.5,
      },
      -- Other telescope configuration options
    },
  },
}

telescope.load_extension "lazy"
telescope.load_extension "media_files"
