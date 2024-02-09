vim.api.nvim_create_user_command("LuaSnipEdit", function()
	vim.cmd([[e ~/.config/nvim/lualoader/all.lua]])
end, {})
