return {
  {
    "smjonas/inc-rename.nvim",
    cmd = "IncRename",
    config = true,
  },
  {
    "ThePrimeagen/99",
    config = function()
      require("99").setup({})
    end,
  },
}
