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

        if vim.bo.ft == "TelescopePrompt" and vim.fn.mode() == "i" then
            vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>", true, false, true), "i", false)
        end
    end,
})

vim.api.nvim_create_autocmd('User', {
    pattern = 'AutoSaveWritePost',
    group = group,
    callback = function(opts)
        if opts.data.saved_buffer ~= nil then
            local filename = vim.api.nvim_buf_get_name(opts.data.saved_buffer)
            local savetime = vim.fn.strftime("%H:%M:%S")
            print("Saved " .. filename .. ' at ' .. savetime)
        end
    end,
})
