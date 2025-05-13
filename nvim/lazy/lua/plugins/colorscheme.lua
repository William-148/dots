return {
  {
    "folke/tokyonight.nvim",
    lazy = true,
    opts = { style = "night" },
  },
  {
    "Shatur/neovim-ayu",
    config = function()
      require("ayu").setup({
        mirage = false, -- Change to true if you prefer the theme "mirage".
        overrides = {
          Normal = { bg = "None" },
          LineNr = { fg = "#818181" },
          FloatBorder = { bg = "#0a0e14" },
          FloatTitle = { bg = "#0a0e14" },
        },
      })
    end,
  },
  -- Configure LazyVim colorscheme
  {
    "LazyVim/LazyVim",
    opts = {
      -- colorscheme = "tokyonight",
      colorscheme = "ayu",
    },
  },
}
