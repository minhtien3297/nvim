local status, focus = pcall(require, "focus")

if not status then
    return
end

focus.setup({
    ui = {
        number = true,         -- Display line numbers in the focussed window only
        relativenumber = true, -- Display relative line numbers in the focussed window only
    }
})

local focusmap = function(direction)
    vim.keymap.set('n', '<Leader>' .. direction, function()
        focus.split_command(direction)
    end, { desc = string.format('Create or move to split (%s)', direction) })
end

-- Use `<Leader>h` to split the screen to the left, same as command FocusSplitLeft etc
focusmap('h')
focusmap('j')
focusmap('k')
focusmap('l')
