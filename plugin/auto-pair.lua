local status, npairs = pcall(require, "nvim-autopairs")
local status_rule, Rule = pcall(require, 'nvim-autopairs.rule')
local status_ts, ts_conds = pcall(require, 'nvim-autopairs.ts-conds')

if not status then
  vim.notify("autopairs error")
  return
end
if not status_rule then
  vim.notify("autopairs rule error")
  return
end
if not status_ts then
  vim.notify("autopairs ts error")
  return
end

npairs.setup({
  check_ts = true,
  ts_config = {
    lua = { 'string' }, -- it will not add a pair on that treesitter node
    javascript = { 'template_string' },
  }
})

-- press % => %% only while inside a comment or string
npairs.add_rules({
  Rule("%", "%", "lua")
      :with_pair(ts_conds.is_ts_node({ 'string', 'comment' })),
  Rule("$", "$", "lua")
      :with_pair(ts_conds.is_not_ts_node({ 'function' }))
})

