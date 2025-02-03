return {
  {
    "ggandor/leap.nvim",
    keys = {
      -- Remove the 's' keybinding
      { "s", mode = { "n", "x", "o" }, false },
      -- Maybe set it to something else like 'gs'
      { "gs", mode = { "n", "x", "o" }, desc = "Leap forward to" },
    },
  },
}
