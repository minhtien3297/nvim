local status, treesitter = pcall(require, 'nvim-treesitter.configs')

if not status then return end

treesitter.setup {
    ensure_installed = {'lua', 'html', 'css', 'scss', 'json', 'csv', 'dockerfile', 'gitignore', 'git_config', 'git_rebase', 'gitcommit', 'pug', 'robot', 'toml', 'yaml', 'vue', 'tsx', 'typescript', 'vim'},

    highlight = {enable = true},
    indent = {enable = true},
    auto_install = true
}
