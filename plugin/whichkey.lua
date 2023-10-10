local wk = require("which-key")

-- remap
wk.register({
    ["<leader><space>"] = "source file",
    ["<leader>q"] = "Exit file",
    ["<C-f>"] = "Format and Save file",
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

    ["<leader>1"] = "Open file number 1",
    ["<leader>2"] = "Open file number 2",
    ["<leader>3"] = "Open file number 3",
    ["<leader>4"] = "Open file number 4",
})

-- lsp
wk.register({
    ["gd"] = {
        function()
            vim.lsp.buf.declaration()
        end,
        "LSP definition",
    },  

    ["gh"] = {
        function()
            vim.lsp.buf.hover()
        end,
        "LSP hover",
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

    ["<leader>vd"] = {
        function()
            vim.lsp.buf.open_float()
        end,
        "LSP definition",
    },  

    ["[d"] = {
        function()
            vim.lsp.buf.goto_next()
        end,
        "LSP go to next",
    },  

    ["]d"] = {
        function()
            vim.lsp.buf.goto_prev()
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

