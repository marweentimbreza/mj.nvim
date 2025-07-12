return {
  {
    "tpope/vim-sleuth", -- Optional: Detects project-specific indentation
    event = { "BufReadPre", "BufNewFile" },
  },
  {
    "nvim-lua/plenary.nvim", -- Dependency for many plugins
    config = function()
      -- Indentation settings
      vim.o.tabstop = 4        -- Number of spaces a <Tab> counts for
      vim.o.softtabstop = 4    -- Number of spaces for <Tab> in insert mode
      vim.o.shiftwidth = 4     -- Number of spaces for auto-indent
      vim.o.expandtab = true   -- Convert tabs to spaces
      vim.o.smartindent = true -- Smart auto-indentation

      -- Optional: Keymap to toggle expandtab for debugging
      vim.keymap.set("n", "<leader>te", function()
        vim.o.expandtab = not vim.o.expandtab
        print("expandtab: " .. tostring(vim.o.expandtab))
      end, { desc = "Toggle expandtab" })
    end,
  },
}
