local status_wk, wk = pcall(require, "which-key")
local status_builtin, builtin = pcall(require, "telescope.builtin")

if not status_wk then
    return
end
if not status_builtin then
    return
end

wk.setup({
    ignore_missing = true,
})

wk.register({
    -- remap
    ["<leader><space>"] = { ":so<CR>", "Source file" },
    ["<C-q>"] = { "<cmd>q<CR>", "Exit file" },
    ["<C-f>"] = { "magg<S-v><S-g>=`a", "Format file" },
    ["<C-c>"] = { "<Esc>", "Normal Mode", mode = "i" },
    ["<C-y>"] = { [["+y]], "Copy to clipboard", mode = { "n", "v" } },
    J = {
        { "mzJ`z",            "Cut line eazier",     mode = "n" },
        { ":m '>+1<CR>gv=gv", "Highlight rows down", mode = "v" },
    },
    K = { ":m '<-2<CR>gv=gv", "Highlight rows up", mode = "v" },

    -- nvim tree
    [";;"] = { "<cmd>NvimTreeToggle<CR>", "Toggle Tree" },

    -- git fugitive
    ["<leader>f"] = {
        name = "fugitive",

        function()
            vim.cmd.Git()
        end,
        "Fugitive",
    },

    -- gitsigns
    ["<leader>h"] = {
        name = "gitsigns",

        s = "Stage Hunk",
        r = "Reset Hunk",
        S = "Stage Buffer",
        u = "Undo Stage Hunk",
        R = "Reset Buffer",
        p = "Preview Hunk",
        b = "Blame Line Full",
        d = "Diff This",
        D = "Diff This ~",
    },

    ["<leader>t"] = {
        name = "gitsigns",

        b = "Toggle current line blame",
        d = "Toggle deleted",
    },

    -- lsp
    ["<leader>l"] = {
        name = "lsp",

        o = {
            function()
                vim.diagnostic.open_float()
            end,
            "Show diagnostic of word under",
        },

        c = {
            function()
                vim.lsp.buf.code_action()
            end,
            "Code action",
        },

        r = {
            function()
                vim.lsp.buf.rename()
            end,
            "Rename all references",
        },
    },

    -- telescope
    [";"] = {
        name = "telescope",

        f = {
            function()
                builtin.find_files()
            end,
            "Find File",
        },

        g = {
            function()
                builtin.live_grep()
            end,
            "Search String",
        },

        c = {
            function()
                builtin.commands()
            end,
            "Search Commands",
        },

        h = {
            function()
                builtin.help_tags()
            end,
            "Search Help",
        },

        r = {
            function()
                builtin.registers()
            end,
            "Search registers",
        },

        k = {
            function()
                builtin.keymaps()
            end,
            "Search keymaps",
        },

        ["gr"] = {
            function()
                builtin.lsp_references()
            end,
            "Go to references",
        },

        ["gd"] = {
            function()
                builtin.lsp_definitions()
            end,
            "Go to definitions",
        },

        ["di"] = {
            function()
                builtin.diagnostics()
            end,
            "Diagnostics",
        },

        ["gst"] = {
            function()
                builtin.git_status()
            end,
            "Git status",
        },

        ["gco"] = {
            function()
                builtin.git_commits()
            end,
            "Git commit",
        },
    },
})
