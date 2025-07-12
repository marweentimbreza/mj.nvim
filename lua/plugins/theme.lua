return {
  {
    "ellisonleao/gruvbox.nvim",
    priority = 1000, -- Ensure it loads early to avoid theme flickering
    config = function()
      require("gruvbox").setup({
        -- Configuration options
        terminal_colors = true, -- Use theme colors in Neovim's terminal
        undercurl = true, -- Enable undercurl for diagnostics
        underline = true, -- Enable underlines
        bold = true, -- Enable bold text
        italic = {
          strings = true,
          emphasis = true,
          comments = true,
          operators = false,
          folds = true,
        },
        strikethrough = true,
        invert_selection = false, -- Don't invert selection colors
        invert_signs = false,
        invert_tabline = false,
        invert_intend_guides = false,
        inverse = true, -- Invert background for certain UI elements
        contrast = "hard", -- Options: "hard", "medium" (default), "soft"
        palette_overrides = {}, -- Customize colors if needed
        overrides = {}, -- Customize highlights if needed
        dim_inactive = false, -- Don't dim inactive windows
        transparent_mode = false, -- Set to true for transparent background
      })

      -- Set the colorscheme
      vim.cmd([[colorscheme gruvbox]])

      -- Optional: Additional highlight tweaks
      vim.api.nvim_set_hl(0, "Normal", { bg = "none" }) -- Transparent background
      vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" }) -- Transparent floating windows
    end,
  },
}
