local key = require("keymap.key")
local nmap = key.nmap
local imap = key.imap
local omap = key.omap
local vmap = key.vmap

imap("jk", "<ESC>", "editor: escape")

nmap(";w", ":w<CR>", "Save file")
nmap("<C-n>", ":Lexplore!<CR><CR>", "Toggle File tree")
nmap("<leader>ss", ":echo 'saved session'<CR>:mks!<CR>", "editor: save vim session")
nmap("<leader>lcd", ":lcd %:h | lua print('Directory changed')<CR>", "editor: change current working directory")
nmap("<leader>lcp", ":lcd ../ <CR>", "editor: change current working directory to parent")

nmap("<M-j>", ":bnext<CR>", "editor: move to next buffer")
nmap("<M-k>", ":bprev<CR>", "editor: move to previous buffer")
nmap("<leader>w", ":write<CR>", "editor: save file")
nmap("<leader>q", ":quit<CR>", "editor: quit")
nmap("<leader>bd", ":bd<CR>", "editor: close buffer")
nmap("<leader>no", ":echo 'noh'<CR>:noh<CR>", "editor: nothing")
nmap("<leader>m", ":make<CR>", "editor: make")
nmap("<leader>ff", ":echo ':find '<CR>:find ", "editor:find file")
nmap("<leader>rl", ":echo ':s/<C-r><C-w>/'<CR>:s/<C-r><C-w>//g<Left><Left>")
nmap("<leader>cl", ":echo ':colorscheme'<CR>:colorscheme ", "editor: choose colorscheme")

nmap("<leader>fm", function()
	require("conform").format({
		lsp_fallback = false,
		async = false,
		timeout_ms = 1000,
	})
end, "lsp: format current file")

vmap("<leader>fm", function()
	require("conform").format({
		lsp_fallback = false,
		async = false,
		timeout_ms = 1000,
	})
end, "lsp: format current file")

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

nmap("<leader>lx", ":LspStop ", "lsp: stop")
nmap("<leader>ls", ":LspStart ", "lsp: stop")
omap("<leader>ms", ":Mason<CR>", "mason: show")

