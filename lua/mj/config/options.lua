local opt = vim.opt

-- Tab & indentation
opt.tabstop = 4
opt.shiftwidth = 4
opt.softtabstop = 4
opt.expandtab = true
opt.smartindent = true
-- Word wraping
opt.wrap = false -- set to false to test

-- search
opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true

-- appearance 
opt.number = true
opt.relativenumber = true
opt.termguicolors = true
opt.scrolloff = 9
opt.completeopt = "menuone,noinsert,noselect"

-- behaviour
opt.hidden = true
opt.errorbells = false
opt.swapfile = false
opt.backup = false
opt.undodir = vim.fn.expand("~/.vim/undodir")
opt.undofile = true
opt.modifiable = true
opt.mouse = "a"
opt.encoding = "UTF-8"
opt.showmode = false
opt.clipboard = "unnamedplus"


-- folds
opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()"
opt.foldlevel = 99
