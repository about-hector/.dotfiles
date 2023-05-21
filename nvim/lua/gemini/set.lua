local opt = vim.opt -- to avoid repeating vim.opt each time 


-- customize line numbers on the side
opt.number = true -- show numbers
opt.relativenumber = true -- show the other lines' number relatively to where I am now

-- tabbing/indentation options
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4

opt.expandtab = true
opt.autoindent = true

opt.smartindent = true

opt.scrolloff = 8
opt.signcolumn = "yes"

-- disallow line-wrapping
opt.wrap = false

-- search settings ( /searchterm in normal mode ) 
-- when searching, ignore case
opt.ignorecase = true

-- but if i explicitly use an upper case in my search, then make the search case-sensitive
opt.smartcase = true

-- highlight search results
--opt.hlsearch = false

-- incremental search (ie. try /opt.* = | opt.* )
opt.incsearch = true

-- underlines the whole line I'm on
opt.cursorline = true

opt.termguicolors = true

opt.updatetime = 50

-- colors the column nr 80, useful to keep line-length under control
opt.colorcolumn = '80'

opt.isfname:append('@-@')
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true


vim.g.mapleader = ' '
