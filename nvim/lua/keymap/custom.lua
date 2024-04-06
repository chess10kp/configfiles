local key = require("keymap.key")
local nmap = key.nmap
local imap = key.imap
local omap = key.omap
local vmap = key.vmap

imap("jk", "<ESC>", "editor: escape")

nmap(";w", ":w<CR>", "Save file")
nmap("<C-n>", ":Lexplore!<CR><CR>", "Toggle File tree")
nmap("<leader>ss", "<Cmd>echo 'saved session'<CR><Cmd>mks!<CR>", "editor: save vim session")
nmap("<leader>lcd", "<Cmd>lcd %:h<CR><Cmd>pwd<CR>", "editor: change current working directory")
nmap("<leader>lcc", "<Cmd>lcd ../ <CR><Cmd>pwd<CR>", "editor: change current working directory to parent")

nmap("<M-j>", ":bnext<CR>", "editor: move to next buffer")
nmap("<M-k>", ":bprev<CR>", "editor: move to previous buffer")
nmap("<leader>w", "<Cmd>write<CR>", "editor: save file")
nmap("<leader>q", "<Cmd>quit<CR>", "editor: quit")
nmap("<leader>bd", "<Cmd>bd<CR>", "editor: close buffer")
nmap("<leader>no", ":echo 'noh'<CR>:noh<CR>", "editor: nothing")
nmap("<leader>ff", 
  function ()
    vim.api.nvim_feedkeys(":find ", "n", true)
  end,
  "editor:find file")
nmap("<leader>rl", ":echo ':s/<C-r><C-w>/'<CR>:s/<C-r><C-w>//g<Left><Left>", "editor: replace word under cursor")
nmap("<leader>cl", 
  function ()
    vim.api.nvim_feedkeys(":colorscheme ", "n", true)
  end,
  "editor: choose colorscheme")

nmap("<leader>so", "<Cmd>echo 'sourced'<CR><Cmd>so<CR>", "editor: source file")
nmap("<leader>cc" , function ()
  vim.api.nvim_feedkeys(":make -l ", "n", true)
end)

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

