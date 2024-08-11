local key = require("keymap.key")
local nmap = key.nmap
local imap = key.imap
local omap = key.omap
local vmap = key.vmap
local cmap = key.cmap

imap("jk", "<ESC>", "editor: escape")

-- nmap(";w", ":w<CR>", "Save file")
nmap("<C-n>", ":silent Lexplore!<CR><CR>", "Toggle File tree")
nmap("<leader>ss", "<Cmd>echo 'saved session'<CR><Cmd>mks!<CR>", "editor: save vim session")
nmap("<leader>lcd", "<Cmd>lcd %:h<CR><Cmd>pwd<CR>", "editor: change current working directory")

nmap("<M-j>", ":bnext<CR>", "editor: move to next buffer")
nmap("<M-k>", ":bprev<CR>", "editor: move to previous buffer")
nmap("<leader>w", "<Cmd>write<CR>", "editor: save file")
nmap("<leader>q", "<Cmd>quit<CR>", "editor: quit")
nmap("<leader>bd", "<Cmd>bn|bd #<CR>", "editor: close buffer")
nmap("<leader>no", ":echo 'noh'<CR>:noh<CR>", "editor: nothing")
cmap("jk", "<ESC>", "editor: escape")
nmap("<leader>tg", ":!ctags -R *<CR>", "lsp: generate tags")
nmap("<leader>ff", function()
	vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(":find **/**<Left>", true, false, true), "n", false)
end, "editor:find file")
nmap("<leader>rw",function( ) 
  vim.api.nvim_feedkeys( vim.api.nvim_replace_termcodes( "<Esc>:s/<C-r><C-w>//g<Left><Left>", true, false, true), "n", false) 
end , "editor: replace word under cursor")
vmap("<leader>rw", function ()
  vim.api.nvim_feedkeys( vim.api.nvim_replace_termcodes( "<Esc>:'<,'>s/<C-r><C-w>//g<Left><Left>", true, false, true), "n", false)
end, "editor: replace word under cursor")
nmap("<leader>cl", function()
	vim.api.nvim_feedkeys(":colorscheme ", "n", true)
end, "editor: choose colorscheme")

nmap("<leader>so", "<Cmd>echo 'sourced'<CR><Cmd>so<CR>", "editor: source file")

nmap("<C-i>", "<C-6>")

vmap("H", "0")
vmap("L", "$")

nmap("<leader>cC", function()
	vim.cmd("RunnerRun")
end)

cmap("<C-u>", function()
	vim.api.nvim_feedkeys(".*", "n", true)
end)
cmap("<C-o>", function()
	vim.api.nvim_feedkeys("\\(.*\\)", "n", true)
end)

cmap("<M-b>", function()
	vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<S-Left>", true, false, true), "c", false)
end)

cmap("<M-f>", function()
	vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<S-Right>", true, false, true), "c", false)
end)

nmap("<M-w>", "<C-^>")
nmap("<C-p>", "<C-^>")

nmap("<M-/>", function()
	vim.o.hlsearch = true
	vim.api.nvim_feedkeys("/", "n", true)
end)

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

vmap("<leader>fm", function()
	require("conform").format({
		lsp_fallback = false,
		async = false,
		timeout_ms = 1000,
	})
end, "lsp: format current file")

nmap("ciw", '"tciw')
nmap("caw", '"tcaw')
nmap("ci{", '"tci{')
nmap("ci(", '"tci(')
nmap("ci)", '"tci)')
nmap("ca}", '"tca}')
nmap("ca}", '"tca}')
nmap("diw", '"tdiw')
nmap("daw", '"tdaw')
nmap("di{", '"tdi{')
nmap("di(", '"tdi(')
nmap("di)", '"tdi)')
nmap("da}", '"tda}')
nmap("da}", '"tda}')

nmap("lo", "<Cmd>SymbolsOutline<CR>")

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
	}

	for _, mark in ipairs(marks) do
		vim.api.nvim_set_keymap(
			"n",
			string.format("m%s", mark),
			string.format(":lua vim.cmd('echo \"mark set\"')<CR>m%s", mark),
			{ noremap = true, silent = true }
		)
	end
end

createMarkMappings()
