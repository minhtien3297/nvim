local status, lualine = pcall(require, 'lualine')

-- if status return false then stop
if not status then return end

lualine.setup {
    options = {
        icons_enabled = true,
        theme = 'tokyonight',
        component_separators = ' ',
        section_separators = '',
    },

    sections = {
        lualine_c = {
            'filename',

            {
                'diagnostics',
                sources = { 'nvim_lsp', 'nvim_diagnostic', 'nvim_workspace_diagnostic', 'coc', 'ale', 'vim_lsp'},
                symbols = { error = ' ', warn = ' ', info = ' ' },
                diagnostics_color = {
                    color_error = { fg = '#ec5f67'},
                    color_warn = { fg = '#ECBE7B' },
                    color_info = { fg = '#008080' },
                },
                colored = true,
                update_in_insert = true,  
                always_visible = true,
            },
        },

        lualine_x = {
            {
                function()
                    local msg = 'No Active Lsp'
                    local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
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
                icon = ' LSP:',
                color = { fg = '#ffffff', gui = 'bold' },
            },

            'encoding',
            'fileformat',
            'filetype'
        }
    }
}
