vim.api.nvim_create_user_command("LuaSnipEdit", function()
	vim.cmd([[e ~/.config/nvim/lualoader/all.lua]])
end, {})

vim.api.nvim_create_user_command("DapRestart", function()
	vim.cmd([[DapTerminate]])
	vim.cmd([[DapContinue]])
end, {})

vim.api.nvim_create_user_command("Zen", function()
	if vim.o.laststatus == 3 then
		vim.o.laststatus = 0
		vim.cmd("ZenMode")
	elseif vim.o.laststatus == 0 then
		vim.o.number = true
		vim.o.relativenumber = true
		vim.o.laststatus = 3
		vim.cmd("ZenMode")
	end
end, {})
