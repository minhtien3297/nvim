local status, treesitter = pcall(require, "nvim-treesitter.configs")

if not status then
  vim.notify('nvim-treesitter.configs error')
  return
end

treesitter.setup({
  ensure_installed = "all",
  ignore_install = { "smali", "scfg" },
  sync_install = true,
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
