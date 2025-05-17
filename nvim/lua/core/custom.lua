vim.o.syntax = "on"


vim.loader.enable()
require("core.command")
require("modules.configs.ui.statusline")

vim.cmd("inoreabbr \\a\\ α")
vim.cmd("inoreabbr \\e\\ ε")
vim.cmd("inoreabbr \\b\\ β")
