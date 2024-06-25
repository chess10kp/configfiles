local M = {}

print("loaded runner.lua")

local function generate_keymaps(filetype, command, keymap)
  vim.api.nvim_buf_set_keymap("n", "<leader>rf", command)
end

M.setup = function(opts)
	print("Setup has been called ")

	filetypes = {
		python = {},
		javascript = {},
		cpp = {},
		c = {},
	}

end

return M
