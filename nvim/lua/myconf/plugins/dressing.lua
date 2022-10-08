require("dressing").setup({
  input = {
    anchor = "SW",
    mappings = {
      i = {
        ["<C-p>"] = "HistoryPrev",
        ["<C-n>"] = "HistoryNext"
      }
    }
  },
  select = {
    backend = { "telescope" }
  }
})
