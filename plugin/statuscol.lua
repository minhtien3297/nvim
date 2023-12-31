local status_builtin, builtin = pcall(require, "statuscol.builtin")
local status_statuscol, statuscol = pcall(require, "statuscol")

if not status_builtin then
  vim.notify('statuscol.builtin error')
  return
end
if not status_statuscol then
  vim.notify('statuscol error')
  return
end

statuscol.setup({
  foldfunc = "builtin",
  setopt = true,
  relculright = true,
  segments = {
    { text = { builtin.foldfunc },      click = "v:lua.ScFa" },
    { text = { "%s" },                  click = "v:lua.ScSa" },
    { text = { builtin.lnumfunc, " " }, click = "v:lua.ScLa" },
  },
})
