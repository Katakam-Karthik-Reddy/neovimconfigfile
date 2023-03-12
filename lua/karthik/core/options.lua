local opt = vim.opt

-- line numbers
opt.number = true
opt.relativenumber = true

--tab and indentations

opt.tabstop = 4
opt.shiftwidth = 4
opt.softtabstop = 4
opt.expandtab = true
opt.autoindent = true
opt.smartindent = true

--undo dir
opt.undofile = true

-- for faster uptime
opt.updatetime = 50

--visual effect
opt.incsearch = true
opt.colorcolumn = "100"
-- scrolling
opt.scrolloff = 8 -- will have atleat 8lines below

--line warping
opt.wrap = false

-- colorscheme setting 
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"

opt.cursorline = true
