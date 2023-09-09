return function()
	require("nvim-ts-autotag").setup({
		filetypes = {
			"html",
			"javascript",
      "typescript",
			"javascriptreact",
			"typescriptreact",
			"vue",
			"xml",
		},
	})
end
