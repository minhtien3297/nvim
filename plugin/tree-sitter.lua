-- load treesitter, save status to 'status'
local status, treesitter = pcall(require, 'nvim-treesitter.configs')

-- if status return false then stop
if not status then return end

treesitter.setup {
    -- files to check
    ensure_installed = {'lua', 'tsx', 'typescript', 'vim'},

    highlight = {enable = true},
    indent = {enable = true},
    auto_install = false
}
