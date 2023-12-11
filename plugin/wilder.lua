local status, wilder = pcall(require, "wilder")

if not status then
  vim.notify('wilder error')
  return
end

wilder.setup({ modes = { ":", "/", "?" } })

local gradient = {
  "#f5e0dc",
  "#f2cdcd",
  "#f5c2e7",
  "#cba6f7",
  "#f38ba8",
  "#eba0ac",
  "#fab387",
  "#f9e2af",
  "#a6e3a1",
  "#94e2d5",
  "#89dceb",
  "#74c7ec",
  "#89b4fa",
  "#b4befe",
  "#cdd6f4",
  "#bac2de",
  "#a6adc8",
  "#9399b2",
  "#7f849c",
}

for i, fg in ipairs(gradient) do
  gradient[i] = wilder.make_hl("WilderGradient" .. i, "Pmenu", { { a = 1 }, { a = 1 }, { foreground = fg } })
end

wilder.set_option(
  "renderer",
  wilder.popupmenu_renderer(wilder.popupmenu_palette_theme({
    -- 'single', 'double', 'rounded' or 'solid'
    -- can also be a list of 8 characters, see :h wilder#popupmenu_palette_theme() for more details
    border = "rounded",
    max_height = "50%", -- max height of the palette
    min_height = 0,     -- set to the same as 'max_height' for a fixed height window

    highlights = {
      gradient = gradient, -- must be set
      -- selected_gradient key can be set to apply gradient highlighting for the selected candidate.
    },
    highlighter = wilder.highlighter_with_gradient({
      wilder.basic_highlighter(), -- or wilder.lua_fzy_highlighter(),
    }),

    left = { " ", wilder.popupmenu_devicons() },
    right = { " ", wilder.popupmenu_scrollbar() },
    prompt_position = "top", -- 'top' or 'bottom' to set the location of the prompt
    reverse = 0,             -- set to 1 to reverse the order of the list, use in combination with 'prompt_position'
  }))
)
