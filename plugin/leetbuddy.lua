local status, leet = pcall(require, 'leetbuddy')

if not status then
    vim.notify('leetbuddy error')
    return
end

leet.setup({
    language = "js",
})
