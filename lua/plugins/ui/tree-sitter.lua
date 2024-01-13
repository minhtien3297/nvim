return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  opts = {
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
  }
}
