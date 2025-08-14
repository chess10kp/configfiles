local key = require("keymap.key")
local nmap = key.nmap
local imap = key.imap
local cmap = key.cmap
local tmap = key.tmap
local vmap = key.vmap

nmap("Y","y$","edit: Yank text to EOL")
nmap("D","d$","edit: Delete text to EOL")
nmap("<Esc>","<Cmd>noh<CR>","edit: Clear search highlight")
nmap("<C-h>","<C-w>h","window: Focus left")
nmap("<C-l>","<C-w>l","window: Focus right")
nmap("<C-j>","<C-w>j","window: Focus down")
nmap("<C-k>","<C-w>k","window: Focus up")
tmap("<C-h>","<Cmd>wincmd h<CR>","window: Focus left")
tmap("<C-l>","<Cmd>wincmd l<CR>","window: Focus right")
tmap("<C-j>","<Cmd>wincmd j<CR>","window: Focus down")
tmap("<C-k>","<Cmd>wincmd k<CR>","window: Focus up")

	-- Command mode
nmap("<A-[>",function () vim.cmd("vertical resize -5") end ,"window: Resize -5 vertically")
nmap("<A-]>",function () vim.cmd("vertical resize +5") end ,"window: Resize +5 vertically")
nmap("<A-;>",function () vim.cmd("resize -2") end ,"window: Resize -2 horizontally")
nmap("<A-'>",function () vim.cmd("resize +2") end ,"window: Resize +2 horizontally")
nmap("<C-q>",function () vim.cmd("qa!") end ,"edit: Quit")
nmap("tn", function () vim.cmd("tabnew") end ,"tab: Create a new tab")
nmap("tk",function () vim.cmd("tabnext") end ,"tab: Move to next tab")
nmap("tj",function () vim.cmd("tabprevious") end ,"tab: Move to previous tab")
nmap("to",function () vim.cmd("tabonly") end ,"tab: Only keep current tab")


vmap("J",":m '>+1<CR>gv=gv","edit: Move this line down")
vmap("K",":m '<-2<CR>gv=gv","edit: Move this line up")
vmap("<","<gv","edit: Decrease indent")
vmap(">",">gv","edit: Increase indent")
