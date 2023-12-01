local status, nvim_tree = pcall(require, "nvim-tree")
local api_status, api = pcall(require, "nvim-tree.api")

local HEIGHT_RATIO = 0.8 -- You can change this
local WIDTH_RATIO = 0.5  -- You can change this too

if not status then
    vim.notify('nvim_tree error')
    return
end

if not api_status then
    vim.notify('nvim_tree.api error')
    return
end

local function open_nvim_tree(data)
    -- buffer is a real file on the disk
    local real_file = vim.fn.filereadable(data.file) == 1

    -- buffer is a [No Name]
    local no_name = data.file == "" and vim.bo[data.buf].buftype == ""

    if not real_file and not no_name then
        return
    end

    -- open the tree, find the file
    api.tree.toggle({ focus = true, find_file = true })
end

local function my_on_attach(bufnr)
    local function opts(desc)
        return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
    end

    local function edit_or_open()
        local node = api.tree.get_node_under_cursor()

        if node.nodes ~= nil then
            -- expand or collapse folder
            api.node.open.edit()
        else
            -- open file
            api.node.open.edit()
            -- Close the tree if file was opened
            api.tree.close()
        end
    end

    -- open as vsplit on current node
    local function vsplit_preview()
        local node = api.tree.get_node_under_cursor()

        if node.nodes ~= nil then
            -- expand or collapse folder
            api.node.open.edit()
        else
            -- open file as vsplit
            api.node.open.vertical()
        end

        -- Finally refocus on tree if it was lost
        api.tree.focus()
    end

    -- mark operation
    local mark_move_j = function()
        api.marks.toggle()
        vim.cmd("norm j")
    end
    local mark_move_k = function()
        api.marks.toggle()
        vim.cmd("norm k")
    end

    -- marked files operation
    local mark_trash = function()
        local marks = api.marks.list()
        if #marks == 0 then
            table.insert(marks, api.tree.get_node_under_cursor())
        end
        vim.ui.input({ prompt = string.format("Trash %s files? [y/n] ", #marks) }, function(input)
            if input == "y" then
                for _, node in ipairs(marks) do
                    api.fs.trash(node)
                end
                api.marks.clear()
                api.tree.reload()
            end
        end)
    end
    local mark_remove = function()
        local marks = api.marks.list()
        if #marks == 0 then
            table.insert(marks, api.tree.get_node_under_cursor())
        end
        vim.ui.input({ prompt = string.format("Remove/Delete %s files? [y/n] ", #marks) }, function(input)
            if input == "y" then
                for _, node in ipairs(marks) do
                    api.fs.remove(node)
                end
                api.marks.clear()
                api.tree.reload()
            end
        end)
    end

    local mark_copy = function()
        local marks = api.marks.list()
        if #marks == 0 then
            table.insert(marks, api.tree.get_node_under_cursor())
        end
        for _, node in pairs(marks) do
            api.fs.copy.node(node)
        end
        api.marks.clear()
        api.tree.reload()
    end
    local mark_cut = function()
        local marks = api.marks.list()
        if #marks == 0 then
            table.insert(marks, api.tree.get_node_under_cursor())
        end
        for _, node in pairs(marks) do
            api.fs.cut(node)
        end
        api.marks.clear()
        api.tree.reload()
    end

    -- default mapping
    api.config.mappings.default_on_attach(bufnr)

    vim.keymap.set("n", "?", api.tree.toggle_help, opts("Toggle Help"))
    vim.keymap.set("n", "l", edit_or_open, opts("Edit Or Open"))
    vim.keymap.set("n", "L", vsplit_preview, opts("Vsplit Preview"))
    vim.keymap.set("n", "h", api.node.navigate.parent_close, opts("Collapse"))
    vim.keymap.set("n", "p", api.fs.paste, opts("Paste"))
    vim.keymap.set("n", "J", mark_move_j, opts("Toggle Bookmark Down"))
    vim.keymap.set("n", "K", mark_move_k, opts("Toggle Bookmark Up"))
    vim.keymap.set("n", "dd", mark_cut, opts("Cut File(s)"))
    vim.keymap.set("n", "df", mark_trash, opts("Trash File(s)"))
    vim.keymap.set("n", "dF", mark_remove, opts("Remove File(s)"))
    vim.keymap.set("n", "yy", mark_copy, opts("Copy File(s)"))
    vim.keymap.set("n", "mv", api.marks.bulk.move, opts("Move Bookmarked"))
end

nvim_tree.setup({
    on_attach = my_on_attach,

    filters = {
        dotfiles = false,      -- show dot files
        custom = { "^.git$" }, -- hide git folder
        git_ignored = false,   -- show git ignore files
    },

    view = {
        cursorline = true,
        relativenumber = true,
        float = {
            enable = true,
            open_win_config = function()
                local screen_w = vim.opt.columns:get()
                local screen_h = vim.opt.lines:get() - vim.opt.cmdheight:get()
                local window_w = screen_w * WIDTH_RATIO
                local window_h = screen_h * HEIGHT_RATIO
                local window_w_int = math.floor(window_w)
                local window_h_int = math.floor(window_h)
                local center_x = (screen_w - window_w) / 2
                local center_y = ((vim.opt.lines:get() - window_h) / 2) - vim.opt.cmdheight:get()
                return {
                    border = "rounded",
                    relative = "editor",
                    row = center_y,
                    col = center_x,
                    width = window_w_int,
                    height = window_h_int,
                }
            end,
        },
        width = function()
            return math.floor(vim.opt.columns:get() * WIDTH_RATIO)
        end,
    },
})

-- open file after create
api.events.subscribe(api.events.Event.FileCreated, function(file)
    vim.cmd("edit " .. file.fname)
end)

-- vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })
