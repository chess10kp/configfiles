local key = require("keymap.key")
local nmap = key.nmap
local imap = key.imap
local vmap = key.vmap
local cmap = key.cmap
local tmap = key.tmap

nmap("<leader>z", "<Cmd>Lazy<CR>", "editor: open lazy")
imap("jk", "<ESC>", "editor: escape")
nmap("<leader>ss", "<Cmd>echo 'saved session'<CR><Cmd>mks!<CR>", "editor: save vim session")
nmap("<leader>lcd", "<Cmd>lcd %:h<CR><Cmd>pwd<CR>", "editor: change current working directory")
nmap("<leader>cd", "<Cmd>lcd ..<CR><Cmd>pwd<CR>", "editor: change go down working directory")
nmap("<M-j>", "<Cmd>bnext<CR>", "editor: move to next buffer")
nmap("<M-k>", "<Cmd>bprev<CR>", "editor: move to previous buffer")
nmap("<leader>w", "<Cmd>write<CR>", "editor: save file")
nmap("<leader>fs", "<Cmd>write<CR>", "editor: save file")
nmap("<leader>q", "<Cmd>quit!<CR>", "editor: quit")
nmap("<leader>bd", "<Cmd>bn|bd #<CR>", "editor: close buffer")
nmap("<leader>ba", "<Cmd>bwipeout|enew<CR>", "editor: close all buffers")
nmap("<leader>no", "<Cmd>echo 'noh'<CR>:noh<CR>", "editor: nothing")
cmap("jk", "<ESC>", "editor: escape")
nmap("<leader>tg", "<Cmd>silent !ctags -R *<CR>", "editor: generate tags")
nmap("<M-h>", "<Cmd>Floaterminal<CR>", "editor: open terminal")
tmap("<M-h>", "<Cmd>Floaterminal<CR>", "editor: open terminal")
nmap("<leader>so", "<Cmd>echo 'sourced'<CR><Cmd>so<CR>", "editor: source file")
nmap("<CR>", "")
nmap("<M-w>", "<C-^>", "editor: other file")
nmap("<M-e>", "<Cmd>Explore<CR>", "editor: explore")

nmap("<leader>rw", function()
	vim.api.nvim_feedkeys(
		vim.api.nvim_replace_termcodes("<Esc>:s/<C-r><C-w>//g<Left><Left>", true, false, true),
		"n",
		false
	)
end, "editor: replace word under cursor")
vmap("<leader>rw", function()
	vim.api.nvim_feedkeys(
		vim.api.nvim_replace_termcodes("<Esc>:'<,'>s/<C-r><C-w>//g<Left><Left>", true, false, true),
		"n",
		false
	)
end, "editor: replace word under cursor")

nmap("<leader>eb", function ()
  vim.cmd("Explore")
end, "editor: open netrw")

nmap("/", function()
	vim.o.hlsearch = false
	vim.api.nvim_feedkeys("/", "n", true)
end)

nmap("<leader>tt", function()
	vim.cmd([[
  cclose
  Todos
  ]])
end)

