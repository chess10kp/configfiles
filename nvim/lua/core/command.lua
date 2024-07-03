vim.api.nvim_create_user_command("LuaSnipEdit", function()
	vim.cmd([[e ~/.config/nvim/lualoader/all.lua]])
end, {})

vim.api.nvim_create_user_command("Todos", function()
	-- change grep opts to rg
	local grepopts = vim.o.grepprg
	vim.o.grepprg = "rg --hidden --vimgrep --smart-case --glob '!.git' -g '!node_modules/' -g '!venv/' --"
	vim.cmd([[
 silent grep todo:  
 copen
  ]])
	-- reset default options for grep
	vim.o.grepprg = grepopts
end, {})

