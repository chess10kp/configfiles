local g = vim.g
local opt = vim.opt
                
g.netrw_banner = 0
g.netrw_liststyle = 3
g.netrw_browse_split = 1
g.netrw_altv = 1
g.netrw_keepdir = 0
g.netrw_winsize =20
local augroup = vim.api.nvim_create_augroup

opt.guicursor = ""

opt.number = true
opt.relativenumber = true

opt.tabstop = 8
opt.softtabstop = 8
opt.shiftwidth = 8
opt.expandtab = true

opt.smartindent = true

opt.wrap = false

opt.swapfile = false
opt.backup = false
opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
opt.undofile = true

opt.hlsearch = false
opt.incsearch = true

opt.termguicolors = true

opt.scrolloff = 8
opt.signcolumn = "yes"
opt.isfname:append("@-@")

opt.updatetime = 50

