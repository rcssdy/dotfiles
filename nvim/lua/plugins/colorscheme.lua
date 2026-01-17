return {
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("tokyonight").setup({
        style = "night", -- options: "storm", "moon", "night", "day"
        transparent = false,
      })
      vim.cmd.colorscheme("tokyonight")
    end,
  },
}
