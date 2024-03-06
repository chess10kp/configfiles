local key = require("keymap.key")
local nmap = key.nmap
local imap = key.imap
local omap = key.omap

imap("jk", "<ESC>", "editor: escape")

nmap( ";w" , ":w<CR>", "Save file")
nmap( "<C-n>",":Lexplore!<CR><CR>" , "Toggle File tree") 
nmap("<leader>ss", ":mks!<CR>", "editor: save vim session")
nmap("<leader>lcd", ":lcd %:h | lua print('directory changed')<CR>", "editor: save vim session") 
nmap("<M-j>", ":bnext<CR>", "editor: move to next buffer")
nmap("<Tab>", ":bnext<CR>", "editor: move to next buffer")
nmap("<M-k>", ":bprev<CR>", "editor: move to previous buffer")
nmap("<S-Tab>", ":bprev<CR>", "editor: move to previous buffer")
nmap("<M-S-J>", ":tabnext<CR>", "editor: move to next tab")
nmap("<M-S-K>", ":tabprev<CR>", "editor: move to previous tab")
nmap("<leader>w", ":write<CR>", "editor: save file")
nmap("<leader>q", ":quit<CR>", "editor: quit")
nmap("<leader>bd", ":bd<CR>", "editor: close buffer")
nmap("<leader>no", ":noh<CR>", "editor: nothing")
nmap("<leader>m", ":make<CR>", "editor: make")

nmap("<leader>fm", ":lua vim.lsp.buf.format()<CR>", "lsp: format current file")

nmap("<leader>cl", ":colorscheme ", "editor: choose colorscheme")

nmap("ciw", '"_ciw')
nmap("caw", '"_caw')
nmap("ci{", '"_ci{')
nmap("ci(", '"_ci(')
nmap("ci)", '"_ci)')
nmap("ca}", '"_ca}')
nmap("ca}", '"_ca}')
nmap("diw", '"_diw')
nmap("daw", '"_daw')
nmap("di{", '"_di{')
nmap("di(", '"_di(')
nmap("di)", '"_di)')
nmap("da}", '"_da}')
nmap("da}", '"_da}')

omap("aq" , "a\"")
omap("iq" , "i\"")
omap("aQ" , "a'")
omap("iq" , "i'")

nmap("<leader>lx", ":LspStop ", "lsp: stop")
nmap("<leader>ls", ":LspStart ", "lsp: stop")
nmap("<leader>ms", ":Mason<CR>", "mason: show")

