-- To see all highlighting groups, you can use:
-- :source $VIMRUNTIME/syntax/hitest.vim
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
          NormalFloat = { bg = "none" },
          -- FloatBorder = { bg = "#0a0e14" },
          -- FloatTitle = { bg = "#0a0e14" },
          NonText = { fg = "#555962" },
          SnacksIndent = { fg = "#1E222A" },
          TelescopeNormal = { bg = "none" },
          TelescopeBorder = { bg = "none" },
          LspInfoBorder = { bg = "none" },
        },
      })
    end,
  },
  {
    "drewxs/ash.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("ash").setup({
        transparent = true,
        term_colors = true,
        highlights = {
          LineNr = { fg = "#616161" },
        },
      })
      -- setup must be called before loading
      -- vim.cmd.colorscheme("ash")
    end,
  },
  -- Configure LazyVim colorscheme
  {
    "LazyVim/LazyVim",
    opts = {
      -- colorscheme = "tokyonight",
      -- colorscheme = "ayu",
      colorscheme = "ash",
    },
  },
}
