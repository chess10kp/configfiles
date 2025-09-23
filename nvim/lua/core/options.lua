local global = require("core.global")
local o = vim.o
local g = vim.g

vim.cmd([[
set path+=**
]])
-- o.backupdir = global.cache_dir .. "backup/",
-- o.directory = global.cache_dir .. "swap/",
-- o.pumblend = 10,
-- o.spellfile = global.cache_dir .. "spell/en.uft-8.add",
-- o.viewdir = global.cache_dir .. "view/",
o.winblend = 0

o.more = false
o.guicursor = "n-v-c:block,i-ci-ve:block,r-cr:hor20,o:hor50" --makes everything block cursor
o.hlsearch = true
o.autoindent = true
o.autoread = true
-- o.fcs = "eob: " -- get rid of the annoying ~ at the end of file
o.autowrite = true
o.backspace = "indent,eol,start"
o.backup = false
o.backupskip = "/tmp/*,$TMPDIR/*,$TMP/*,$TEMP/*,*/shm/*,/private/var/*,.vault.vim"
o.breakat = [[\ \;:,!?]]
o.breakindentopt = "shift:2,min:20"
o.clipboard = "unnamed"
o.cmdheight = 1
o.cmdwinheight = 1
o.complete = ".,w,b,k"
o.completeopt = "menuone,noselect"
o.concealcursor = "niv"
o.conceallevel = 1
o.showmode =false
o.inccommand = "split"
o.diffopt = "filler,iwhite,internal,algorithm:patience"
o.display = "lastline"
o.encoding = "utf-8"
o.equalalways = false
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
o.incsearch = true
o.infercase = true
o.jumpoptions = "stack"
o.linebreak = true
o.list = true
o.listchars = "tab:  ,nbsp:+,trail: ,extends: ,precedes: "
o.magic = true
o.mousescroll = "ver:3,hor:6"
o.mouse = "n"
o.number = true
o.numberwidth = 1
o.previewheight = 12
o.pumheight = 15
o.relativenumber = true
o.ruler = false
o.scrolloff = 10
-- o.scroll = 15
o.sessionoptions="blank,buffers,curdir,folds,globals,tabpages"
o.shada = "!,'300,<50,@100,s10,h"
o.shiftround = true
o.shiftwidth = 2
o.shortmess = "aoOTIcFs"
o.showbreak = "↳  "
o.showcmd = false
o.showcmdloc = "last"
o.sidescrolloff = 5
o.signcolumn = "yes"
o.smartcase = true
o.smarttab = true
o.softtabstop = 8
o.splitbelow = true
o.splitright = true
o.startofline = false
o.swapfile = false
o.switchbuf = "usetab,uselast"
o.synmaxcol = 2500
o.tabstop = 2
o.termguicolors = true
o.timeout = true
o.timeoutlen = 300
o.ttimeout = true
o.undodir = global.cache_dir .. "undo/"
o.undofile = true
-- Please do NOT set `updatetime` to above 500, otherwise most plugins may not work correctl
o.updatetime = 100
o.viewoptions = "folds,cursor,curdir,slash,unix"
o.virtualedit = "block"
o.visualbell = true
o.wildignore =
	".git,**/node_modules/**,.hg,.svn,*.pyc,*.o,*.out,*.jpg,*.jpeg,*.png,*.gif,*.zip,**/tmp/**,*.DS_Store,**/bower_modules/**"
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
g.netrw_winsize = 25
g.netrw_liststyle = 0
g.netrw_banner = 0
g.netrw_browse_split = 0
g.netrw_altv = 0

--Plugin: hard time
vim.g.hardtime_default_on = 1
vim.g.hardtime_ignore_quickfix = 1
vim.g.hardtime_allow_different_key = 1

--Plugin: vimtex
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

o.digraph = false
