local M = {}

M.back_and_forth = function(opts)
	if vim.g.back then
		vim.g.back = false
		vim.g.forth = true
		vim.api.nvim_feedkeys("`f", "n", false)
	else
		vim.g.back = true
		vim.g.forth = false
		vim.api.nvim_feedkeys("`b", "n", false)
	end
end

M.save_position = function()
	print("position saved")
	if vim.g.back then
		vim.api.nvim_feedkeys("mb", "n", false)
	else
		vim.api.nvim_feedkeys("mf", "n", false)
	end
end

M.setup = function()
	vim.g.back = true
	vim.g.forth = false
	print("keymaps ")

	vim.api.nvim_set_keymap("n", "<C-m>", "<Cmd>lua require('backForth').back_and_forth()<CR>", {})
  vim.api.nvim_set_keymap("n", "<leader>s", "<Cmd>lua require('backForth').save_position()<CR>", {})
end

return M
