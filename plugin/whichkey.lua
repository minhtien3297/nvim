local wk = require("which-key")

-- remap
wk.register({
    ["<leader><space>"] = "source file",
    ["<leader>q"] = "Exit file",
})

-- remap
wk.register({
    ["<leader>gs"] = {
        function()
            vim.cmd.Git()
        end,
        'Git'
    }
})

-- Trouble
wk.register({
    ["<leader>x"] = {
        function()
            require("trouble").toggle()
        end,
        "Toggle Error List"
    }
})

-- gitsigns
wk.register({
    ["<leader>"] = {
        hs = "Stage Hunk",
        hr = "Reset Hunk",
        hS = "Stage Buffer",
        hu = "Undo Stage Hunk",
        hR = "Reset Buffer",
        hp = "Preview Hunk",
        hb = "Blame Line Full",
        tb = "Toggle Current Line Blame",
        hd = "Diff This",
        hD = "Diff This ~",
        td = "Toggle Deleted",
    }
})

-- harpoon
wk.register({
    ["<C-a>"] = "Add File To Harpoon",
    ["<C-e>"] = "Toggle Harpoon Menu",
})

-- lsp
wk.register({
    ["gd"] = {
        function()
            vim.lsp.buf.declaration()
        end,
        "LSP definition",
    },

    ["<leader>f"] = {
        function()
            vim.lsp.buf.format()
        end,
        "LSP format",
    },

    ["<leader>vws"] = {
        function()
            vim.lsp.buf.workspace_symbol()
        end,
        "LSP workspace symbol",
    },

    ["<leader>vof"] = {
        function()
            vim.diagnostic.open_float()
        end,
        "LSP show diagnostics",
    },

    ["[d"] = {
        function()
            vim.diagnostic.goto_next()
        end,
        "LSP go to next",
    },

    ["]d"] = {
        function()
            vim.diagnostic.goto_prev()
        end,
        "LSP go to prev",
    },

    ["<leader>vca"] = {
        function()
            vim.lsp.buf.code_action()
        end,
        "LSP code action",
    },

    ["<leader>vrr"] = {
        function()
            vim.lsp.buf.references()
        end,
        "LSP references",
    },

    ["<leader>vrn"] = {
        function()
            vim.lsp.buf.rename()
        end,
        "LSP rename",
    },
})

-- telescope
wk.register({
    [";f"] = { "<cmd> Telescope find_files <CR>", "Find files" },
    [";r"] = { "<cmd> Telescope live_grep <CR>", "Live grep" },
    [";fb"] = { "<cmd> Telescope buffers <CR>", "Find buffers" },
    [";xx"] = { "<cmd> Telescope diagnostics<CR>", "Diagnostics" },
})
