local opt = vim.opt

-- tabs & indentation
opt.tabstop = 4
opt.shiftwidth = 4
opt.softtabstop = 4
opt.expandtab = true
opt.wrap = false-- for word wrapping

-- numbers
opt.number = true
opt.relativenumber = true
opt.scrolloff = 9

-- behaviour
opt.encoding = "UTF-8"
opt.clipboard = "unnamedplus"
opt.mouse = "a"
opt.clipboard = "unnamedplus"
opt.showmode = false
opt.modifiable = true
opt.undofile = true


-- folding
opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()"
opt.foldlevel = 69
