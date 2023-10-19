local status, auto_save = pcall(require, 'auto-save')
if not status then return end

auto_save.setup({
    execution_message = {
        enabled = false
    }
})

local group = vim.api.nvim_create_augroup('autosave', {})

vim.api.nvim_create_autocmd('User', {
    pattern = 'AutoSaveWritePre',
    group = group,
    callback = function()
        vim.lsp.buf.format()
    end,
})

vim.api.nvim_create_autocmd('User', {
    pattern = 'AutoSaveWritePost',
    group = group,
    callback = function(opts)
        if opts.data.saved_buffer ~= nil then
            local filename = vim.api.nvim_buf_get_name(opts.data.saved_buffer)
            vim.notify("Saved " .. filename .. '', nil, { title = "Autosave" })
        end
    end,
})
