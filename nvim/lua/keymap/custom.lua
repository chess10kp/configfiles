local bind = require("keymap.bind")

local map_cr = bind.map_cr
---@diagnostic disable-next-line: unused-local
local map_cmd = bind.map_cmd
local map_cu = bind.map_cu

local vim_path = require("core.global").vim_path

local plug_map = {
	-- general keymaps
  ["n|<C-n>"] = map_cu("Lexplore!<CR><CR>"):with_noremap():with_nowait():with_silent():with_desc("Toggle file tree"),
	["n|<leader>ss"] = map_cr("mks!"),
	["n|<leader>lcd"] = map_cr("lcd %:h | lua print('directory changed')<CR>")
		:with_noremap()
		:with_silent()
		:with_nowait()
		:with_desc("change working directory"),
	["n|<M-j>"] = map_cr("bnext"):with_noremap():with_silent():with_nowait():with_desc("next buffer"),
	["n|<Tab>"] = map_cr("bnext"):with_noremap():with_silent():with_nowait():with_desc("next buffer"),
	["n|<S-Tab>"] = map_cr("bprevious"):with_noremap():with_silent():with_nowait():with_desc("next buffer"),
	["n|<M-k>"] = map_cr("bprevious"):with_noremap():with_silent():with_nowait():with_desc("prev buffer"),
	["n|<M-S-k>"] = map_cr("tabprev"):with_noremap():with_silent():with_nowait():with_desc("prev buffer"),
	["n|<M-S-j>"] = map_cr("tabnext"):with_noremap():with_silent():with_nowait():with_desc("prev buffer"),
	["n|<leader>w"] = map_cu("write"):with_noremap():with_silent():with_desc("editn: Save file"),
	["n|<leader>q"] = map_cu(":q"):with_noremap():with_silent():with_desc("editn: Quit window"),
	["n|<leader>bd"] = map_cu("BufDel"):with_noremap():with_silent(),
	["n|<leader>nn"] = map_cr("source %"):with_noremap():with_nowait():with_desc("source current file"),
	["n|<leader>sc"] = map_cr(string.format("source %s/init.lua", vim_path))
		:with_noremap()
		:with_nowait()
		:with_desc("source neovim config"),
	["n|<leader>no"] = map_cr("noh"):with_noremap():with_nowait():with_desc("nothing"),

	--Formatting
	["n|<leader>fm"] = map_cr("lua vim.lsp.buf.format()")
		:with_noremap()
		:with_nowait()
		:with_desc("format the current file"),

	--convienience mappings
  ["o|aq"] = map_cmd('a"'):with_noremap():with_nowait(),
  ["o|iq"] = map_cmd('i"'):with_noremap():with_nowait(),
  ["o|aQ"] = map_cmd("a'"):with_noremap():with_nowait(),
  ["o|iQ"] = map_cmd("i'"):with_noremap():with_nowait(),
  ["n|<leader>ht"] = map_cr("HardTimeToggle"):with_desc("Toggle hard time"):with_noremap():with_nowait(),
  ["n|<leader>cl"] = map_cmd(":colorscheme "):with_noremap():with_nowait(),


	["n|ciw"] = map_cmd('"_ciw'):with_noremap():with_desc("delete inside word"),
	["n|caw"] = map_cmd('"_caw'):with_noremap():with_desc("delete around word"),
	["n|ci("] = map_cmd('"_ci('):with_noremap():with_desc("delete inside parenthesis"),
	["n|ca("] = map_cmd('"_ca('):with_noremap():with_desc("delete around parenthesis"),
	["n|ci)"] = map_cmd('"_ci('):with_noremap():with_desc("delete inside parenthesis"),
	["n|ca)"] = map_cmd('"_ca('):with_noremap():with_desc("delete around parenthesis"),
	["n|ci{"] = map_cmd('"_ci{'):with_noremap():with_desc("delete inside braces"),
	["n|ca{"] = map_cmd('"_ca{'):with_noremap():with_desc("delete around braces"),
	["n|ci}"] = map_cmd('"_ci}'):with_noremap():with_desc("delete inside braces"),
	["n|ca}"] = map_cmd('"_ca}'):with_noremap():with_desc("delete around braces"),

	["n|<leader><leader>"] = map_cmd(':'):with_noremap():with_silent(),


  --Plugin command mappings 
  -- LSP
  ["n|<leader>lx" ] = map_cmd(":LspStop "):with_nowait():with_noremap():with_desc("lsp: stop"),
  ["n|<leader>ls" ] = map_cmd(":LspStart "):with_nowait():with_noremap():with_desc("lsp: Start"),
  ["n|<leader>ms"] = map_cu("Mason"):with_noremap():with_nowait():with_desc("lsp: Toggle Mason"),
  ["n|<M-t>"] = map_cu("TransparentToggle"):with_noremap():with_nowait():with_desc("Toggle transparency")
}

bind.nvim_load_mapping(plug_map)
