return {
  {
    "olimorris/onedarkpro.nvim",
    priority = 1000, -- Ensure it loads first
    config = function()
      require("onedarkpro").setup({
        colorscheme = "onedark_dark",
        options = {
          transparency = true,
          term_colors = true,
        },
        styles = {
          --     strings = "italic",
          --     comments = "italic",
          --     keywords = "italic",
        },
      })
    end,
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "onedark_dark",
    },
  },
}
