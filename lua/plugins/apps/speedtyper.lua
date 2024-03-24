return {
  "NStefan002/speedtyper.nvim",
  cmd = "Speedtyper",
  opts = {
    game_modes = { -- prefered settings for different game modes
      -- type until time expires
      countdown = {
        time = 900,
      },
      -- type until you complete one page
      stopwatch = {
        hide_time = false, -- hide time while typing
      },
    },
  }
}
