local status, treesitter = pcall(require, "nvim-treesitter.configs")

if not status then
    vim.notify('nvim-treesitter.configs error')
    return
end

treesitter.setup({
    ensure_installed = {
        "lua",
        "html",
        "css",
        "scss",
        "json",
        "csv",
        "dockerfile",
        "gitignore",
        "git_config",
        "git_rebase",
        "gitcommit",
        "pug",
        "robot",
        "toml",
        "yaml",
        "vue",
        "tsx",
        "javascript",
        "markdown",
        "typescript",
        "vim",
        "bash",
    },

    highlight = { enable = true },
    indent = { enable = true },
    auto_install = true,
    autotag = {
        enable = true,
    }
})
