local status, scroll = pcall(require, 'neoscroll')

if not status then
    vim.notify('neoscroll error')
    return
end

scroll.setup()
