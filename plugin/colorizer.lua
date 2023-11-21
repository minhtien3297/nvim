local status, color = pcall(require, 'colorizer')

if not status then
    vim.notify("colorizer error")
    return
end

color.setup()
