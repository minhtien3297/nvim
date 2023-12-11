local status, treesitter = pcall(require, "nvim-treesitter.configs")

if not status then
  vim.notify('nvim-treesitter.configs error')
  return
end

treesitter.setup({
  ensure_installed = {
    "lua",
    "luadoc",
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
    "markdown_inline",
    "typescript",
    "comment",
    "vim",
    "bash",
    "regex",
    "php",
    "ruby"
  },

  highlight = { enable = true },
  indent = { enable = true },
  auto_install = true,
  autotag = {
    enable = true,
    enable_rename = true,
    enable_close = true,
    enable_close_on_slash = true,
  }
})
