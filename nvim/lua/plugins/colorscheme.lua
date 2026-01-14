return {
  {
    "ydkulks/cursor-dark.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("cursor-dark").setup({
        style = "dark", -- use "dark-midnight" for the midnight variant
        transparent = false,
      })
    end,
  },
}
