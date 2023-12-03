local status, blame = pcall(require, 'gitblame')

if not status then
    vim.notify("git blame error")
    return
end

blame.setup({
    date_format = "%d/%m/%Y - %X",
    use_blame_commit_file_urls = true,
})
