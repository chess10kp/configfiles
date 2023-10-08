local global = require("core.global")
local o = vim.o
local g = vim.g

-- o.backupdir = global.cache_dir .. "backup/",
-- o.directory = global.cache_dir .. "swap/",
-- o.pumblend = 10,
-- o.spellfile = global.cache_dir .. "spell/en.uft-8.add",
-- o.viewdir = global.cache_dir .. "view/",
-- o.winblend = 10,

o.guicursor = "n-v-c-ci:block" --makes everything block cursor
o.autoindent = true
o.laststatus = 3
o.autoread = true
o.showmode = false
o.fcs = "eob: "
o.ruler = false
o.showcmd = false
o.autowrite = true
o.backspace = "indent,eol,start"
o.backup = false
o.backupskip = "/tmp/*,$TMPDIR/*,$TMP/*,$TEMP/*,*/shm/*,/private/var/*,.vault.vim"
o.breakat = [[\ \;:,!?]]
o.breakindentopt = "shift:2,min:20"
o.clipboard = "unnamed"
o.cmdheight = 0 -- 0, 1,
o.cmdwinheight = 1
o.complete = ".,w,b,k"
o.completeopt = "menuone,noselect"
o.concealcursor = "niv"
o.conceallevel = 0
o.cursorcolumn = false
o.cursorline = 0
o.diffopt = "filler,iwhite,internal,algorithm:patience"
o.display = "lastline"
o.encoding = "utf-8"
o.equalalways = false
o.errorbells = true
o.expandtab = true
o.fileformats = "unix,mac,dos"
o.foldenable = true
o.foldlevelstart = 99
o.formatoptions = "1jcroql"
o.grepformat = "%f:%l:%c:%m"
o.grepprg = "rg --hidden --vimgrep --smart-case --"
o.helpheight = 12
o.hidden = true
o.history = 2000
o.ignorecase = true
o.inccommand = "nosplit"
o.incsearch = true
o.infercase = true
o.jumpoptions = "stack"
o.linebreak = true
o.list = true
o.listchars = "tab:  ,nbsp:+,trail: ,extends: ,precedes: "
o.magic = true
o.mousescroll = "ver:3,hor:6"
o.mouse = ""
o.number = true
o.numberwidth = 1
o.previewheight = 12
o.pumheight = 15
o.redrawtime = 1500
o.relativenumber = true
o.ruler = true
-- o.scrolloff = 2
-- o.scroll = 15
o.sessionoptions = "curdir,help,tabpages,winsize"
o.shada = "!,'300,<50,@100,s10,h"
o.shiftround = true
o.shiftwidth = 2
o.shortmess = "aoOTIcF"
o.showbreak = "↳  "
o.showcmd = false
o.showmode = false
o.showtabline = 2
o.sidescrolloff = 5
o.signcolumn = "yes"
o.smartcase = true
o.smarttab = true
o.softtabstop = 2
o.splitbelow = true
o.splitright = true
o.startofline = false
o.swapfile = false
o.switchbuf = "usetab,uselast"
o.synmaxcol = 2500
o.tabstop = 2
o.termguicolors = true
o.timeout = true
-- You will feel delay when you input <Space> at lazygit interface if you set it a positive value like 300(ms)
o.timeoutlen = 200
o.ttimeout = true
o.ttimeoutlen = 0
o.undodir = global.cache_dir .. "undo/"
o.undofile = true
-- Please do NOT set `updatetime` to above 500, otherwise most plugins may not work correctl
o.updatetime = 200
o.viewoptions = "folds,cursor,curdir,slash,unix"
o.virtualedit = "block"
o.visualbell = true
o.whichwrap = "h,l,<,>,[,],~"
o.wildignore = ".git,.hg,.svn,*.pyc,*.o,*.out,*.jpg,*.jpeg,*.png,*.gif,*.zip,**/tmp/**,*.DS_Store,**/bower_modules/**"
o.wildignorecase = true
o.winminwidth = 10
o.winwidth = 30
o.wrap = false
o.wrapscan = true
o.writebackup = false
	local function isempty(s)
		return s == nil or s == ""
	end

	-- custom python provider
	local conda_prefix = os.getenv("CONDA_PREFIX")
	if not isempty(conda_prefix) then
		vim.g.python_host_prog = conda_prefix .. "/bin/python"
		vim.g.python3_host_prog = conda_prefix .. "/bin/python"
	else
		vim.g.python_host_prog = "python"
		vim.g.python3_host_prog = "python3"
	end

-- global opts
g.vimtex_view_method = "zathura"
g.vimtex_view_general_viewer = "zathura"
g.vimtex_compiler_method = "latexmk"
g.netrw_winsize =25
g.netrw_liststyle = 3
g.netrw_banner = 0
g.netrw_browse_split = 4
g.netrw_altv = 1

vim.cmd([[let g:vimtex_view_general_options = '--unique file:@pdf\#src:@line@tex']])

local function isempty(s)
	return s == nil or s == ""
end
-- custom python provider
local conda_prefix = os.getenv("CONDA_PREFIX")
if not isempty(conda_prefix) then
	g.python_host_prog = conda_prefix .. "/bin/python"
	g.python3_host_prog = conda_prefix .. "/bin/python"
elseif global.is_mac then
	g.python_host_prog = "/usr/bin/python"
	g.python3_host_prog = "/usr/local/bin/python3"
	g.python3_host_prog = "/usr/bin/python3"
	-- Fix sqlite3 missing-lib issue on Windows
	if global.is_windows then
		-- Download the DLLs form https://www.sqlite.org/download.html
		vim.g.sqlite_clib_path = global.home .. "/Documents/sqlite-dll-win64-x64-3400200/sqlite3.dll"
	end
end

-- Fix sqlite3 missing-lib issue on Windows
if global.is_windows then
	-- Download the DLLs form https://www.sqlite.org/download.html
	g.sqlite_clib_path = global.home .. "/Documents/sqlite-dll-win64-x64-3400100/sqlite3.dll"
end
