vim.cmd([[
syntax enable
let g:vimtex_view_method = 'zathura'
let g:vimtex_view_general_viewer = 'zathura'
let g:vimtex_view_general_options = '--unique file:@pdf\#src:@line@tex'
let g:vimtex_compiler_method = 'latexmk'
]])


-- vim.api.nvim_set_hl(0, "Normal" , {bg = "none"})
-- vim.api.nvim_set_hl(0, "NormalFloat" , {bg = "none"})

-- Keymaps
vim.keymap.set("n", "<leader><leader>", ":")
vim.keymap.set("n", "H", "^")
vim.keymap.set("n", "L", "$")

vim.cmd("highlight WinSeperator guibg=None")

-- AUTOCMDS
vim.api.nvim_create_autocmd("WinEnter", {
	callback = function()
		vim.opt.relativenumber = true
		vim.opt.number = true
	end,
})

vim.api.nvim_create_autocmd("WinLeave, BufCreate", {
	callback = function()
		vim.opt.relativenumber = false
		vim.opt.number = false
	end,
})
