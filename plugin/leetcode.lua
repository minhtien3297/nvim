local status, leet = pcall(require, 'leetcode')

if not status then
  vim.notify('leetcode error')
  return
end

leet.setup({
  lang = "vanillajs",
})
