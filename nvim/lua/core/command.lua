vim.api.nvim_create_user_command("LuaSnipEdit", function()
	vim.cmd([[e ~/.config/nvim/lualoader/all.lua]])
end, {})

vim.api.nvim_create_user_command("Todos", function()
	local grepopts = vim.o.grepprg
	vim.o.grepprg = "rg --hidden --vimgrep --smart-case --glob '!.git' -g '!node_modules/' -g '!venv/' --"
	vim.cmd([[
 silent grep todo:  
 copen
  ]])
	vim.o.grepprg = grepopts
end, {})

vim.api.nvim_create_user_command("WorkspaceSearch", function()
	local search = vim.fn.input("Search: ")
	if search == nil then
		return
	end
	vim.cmd("silent grep " .. search)
	vim.cmd("copen")
end, {})
