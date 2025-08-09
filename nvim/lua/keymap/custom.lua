local key = require("keymap.key")
local nmap = key.nmap
local imap = key.imap
local omap = key.omap
local vmap = key.vmap
local cmap = key.cmap

imap("jk", "<ESC>", "editor: escape")

nmap("<leader>ss", "<Cmd>echo 'saved session'<CR><Cmd>mks!<CR>", "editor: save vim session")
nmap("<leader>lcd", "<Cmd>lcd %<Cmd>h<CR><Cmd>pwd<CR>", "editor: change current working directory")
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
nmap("<leader>ee", function()
	vim.api.nvim_feedkeys(":e ~/", "n", true)
end, "editor: open file")

nmap("<leader>so", "<Cmd>echo 'sourced'<CR><Cmd>so<CR>", "editor: source file")

nmap("<CR>", "")
nmap("<M-w>", "<C-^>", "editor: other file")

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

nmap("<leader>fm", function()
	require("conform").format({
		lsp_fallback = false,
		async = false,
		timeout_ms = 1000,
	})
end, "lsp: format current file")

local function createMarkMappings()
	local marks = {
		"a",
		"b",
		"c",
		"d",
		"e",
		"f",
		"g",
		"h",
		"i",
		"j",
		"k",
		"l",
		"m",
		"n",
		"o",
		"p",
		"q",
		"r",
		"s",
		"t",
		"u",
		"v",
		"w",
		"x",
		"y",
		"z",
		"A",
		"B",
		"C",
		"D",
		"E",
		"F",
		"G",
		"H",
		"I",
		"J",
		"K",
		"L",
		"M",
		"N",
		"O",
		"P",
		"Q",
		"R",
		"S",
		"T",
		"U",
		"V",
		"W",
		"X",
		"Y",
		"Z",
	}

	for _, mark in ipairs(marks) do
		vim.api.nvim_set_keymap(
			"n",
			string.format("'%s", mark),
			string.format("`%s", mark),
			{ noremap = true, silent = true }
		)
	end
end

createMarkMappings()
