require 'core.extra'
require 'core.keymaps'
require 'core.options'

-- Set up the Lazy plugin manager
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Set up plugins
require('lazy').setup {
    require 'plugins.lsp',
    require 'plugins.mason',
    require 'plugins.telescope',
    require 'plugins.treesitter',
    require 'plugins.gitsigns',
    require 'plugins.autocomplete',
    require 'plugins.neotree',
    require 'plugins.whichkey',
    require 'plugins.todo-comment',
    require 'plugins.theme',
    require 'plugins.auto-pairs',
    require 'plugins.autocmp',
    require 'plugins.none-ls',
    require 'plugins.cmp',
  require 'plugins.indent'
}

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
