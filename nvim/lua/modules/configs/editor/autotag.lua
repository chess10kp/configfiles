return function()
	require("nvim-ts-autotag").setup({
		opts = {
			enable_close_on_slash = true,
			enable_close = true,
			enable_rename = true,
		},
	})
end
