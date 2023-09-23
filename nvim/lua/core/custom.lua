vim.cmd([[
syntax enable
highlight WinSeperator guibg=None
]])

vim.g.hardtime_default_on = 1
vim.g.hardtime_ignore_quickfix = 1
vim.g.hardtime_allow_different_key = 1

-- AUTOCMDS
vim.api.nvim_create_autocmd("WinEnter", {
	callback = function()
		-- local bufnr = vim.fn.bufnr("%")
		local bufname = vim.api.nvim_buf_get_name(0)
			if bufname ~= "OUTLINE" then
				vim.opt.relativenumber = true
				vim.opt.number = true
		end
	end,
})
vim.api.nvim_create_autocmd("WinLeave, BufCreate", {
	callback = function()
		vim.opt.relativenumber = false
		vim.opt.number = false
	end,
})

vim.api.nvim_create_user_command("LuaSnipEdit", function()
    vim.cmd[[e ~/.config/nvim/lualoader/all.lua]]
end, {})
