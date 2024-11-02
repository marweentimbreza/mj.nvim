require("mj.config.options")
require("mj.config.keymaps")

vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- pane navigation 
vim.keymap.set("n", "<leader>E", ":NvimTreeToggle<CR>", { noremap = true, silent = true})
vim.keymap.set("n", "<leader>fm", ":NvimTreeFocus<CR>", { noremap = true, silent = true})


-- highlight on yank
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  callback = function()
    vim.highlight.on_yank()
  end,
})

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  spec = {
    -- import your plugins
    { import = "mj.plugins" },
  },
  -- Configure any other settings here. See the documentation for more details.
  -- colorscheme that will be used when installing plugins.
  install = { colorscheme = { "gruvbox" } },
  -- automatically check for plugin updates
  checker = { enabled = true },
}, {
  -- Lazy.nvim configuration
  change_detection = {
    enabled = true,
    notify = true, -- Set to true if you want notifications when updates are available
  },
  checker = {
    enabled = true, -- Enable automatic update checking
    frequency = 3600, -- Check for updates every hour (in seconds)
  },
  performance = {
    cache = {
      enabled = true,
    },
  },
})

-- Auto command to run :Lazy sync on startup
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    -- Small delay to ensure everything is loaded
    vim.defer_fn(function()
      vim.cmd("Lazy sync")
    end, 100)
  end,
})
