vim.o.syntax = "on"


vim.loader.enable()
require("core.command")

vim.cmd("inoreabbr \\a\\ α")
vim.cmd("inoreabbr \\e\\ ε")
vim.cmd("inoreabbr \\b\\ β")

require("modules.configs.ui.statusline")
