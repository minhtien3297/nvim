return {
  "NStefan002/speedtyper.nvim",
  cmd = "Speedtyper",
  opts = {
    window = {
      height = 5,         -- integer >= 5 | float in range (0, 1)
      width = 0.6,        -- integer | float in range (0, 1)
      border = "rounded", -- "none" | "single" | "double" | "rounded" | "shadow" | "solid"
    },

    game_modes = { -- prefered settings for different game modes
      -- type until time expires
      countdown = {
        time = 600,
      },
      -- type until you complete one page
      stopwatch = {
        hide_time = false, -- hide time while typing
      },
    },
  }
}
