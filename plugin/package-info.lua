local status, package = pcall(require, 'package-info')

if not status then
  vim.notify('package-info error')
  return
end

package.setup({
  icons = {
    enable = true,
    style = {
      outdated = " | ",
    }
  },
  hide_up_to_date = true,
  hide_unstable_versions = true,
})
