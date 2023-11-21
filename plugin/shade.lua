local status, shade = pcall(require, "shade")

if not status then
    vim.notify('shade error')
    return
end

shade.setup({
    overlay_opacity = 50,
    opacity_step = 1,
})
