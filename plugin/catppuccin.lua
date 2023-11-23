local status, cat = pcall(require, 'catppuccin')

if not status then
    vim.notify('catppuccin error')
    return
end

cat.setup({
    flavour = "mocha",    -- latte, frappe, macchiato, mocha
    dim_inactive = {
        enabled = true,   -- dims the background color of inactive window
        shade = "dark",
        percentage = 0.1, -- percentage of the shade to apply to the inactive window
    },
    integrations = {
        cmp = true,
        harpoon = true,
        ufo = true,
        telescope = true,
        gitsigns = true,
        which_key = true,
        nvimtree = true,
        treesitter = true,
        treesitter_context = true,
        notify = true,
        mini = {
            enabled = true,
            indentscope_color = "",
        },
        indent_blankline = {
            enabled = true,
            scope_color = "", -- catppuccin color (eg. `lavender`) Default: text
            colored_indent_levels = false,
        },
        mason = true,
        native_lsp = {
            enabled = true,
            virtual_text = {
                errors = { "italic" },
                hints = { "italic" },
                warnings = { "italic" },
                information = { "italic" },
            },
            underlines = {
                errors = { "underline" },
                hints = { "underline" },
                warnings = { "underline" },
                information = { "underline" },
            },
            inlay_hints = {
                background = true,
            },
        },
    },
})

vim.cmd.colorscheme "catppuccin"
