return function()
	require("luasnip").config.set_config({
		history = true,
		update_events = "TextChanged,TextChangedI",
		delete_check_events = "TextChanged,InsertLeave",
		enable_autosnippets = true,
	})

	require("luasnip.loaders.from_lua").lazy_load({ paths = "~/.config/nvim/lualoader" })
	require("luasnip.loaders.from_vscode").lazy_load()
	-- require("luasnip.loaders.from_snipmate").lazy_load()

	local ls = require("luasnip")
	vim.keymap.set({ "i", "s" }, "<C-n>", function()
		ls.jump(1)
	end, { silent = true })
	vim.keymap.set({ "i", "s" }, "<C-p>", function()
		ls.jump(-1)
	end, { silent = true })

	ls.filetype_extend("typescriptreact", { "javascriptreact", "javascript", "typescript" })
	ls.filetype_extend("typescript", { "javascriptreact", "javascript", "typescriptreact" })
	ls.filetype_extend("javascriptreact", { "javascript", "typescript", "typescriptreact" })
	ls.filetype_extend("javascript", { "javascript", "typescript", "typescriptreact" })
end
