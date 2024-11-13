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

	vim.keymap.set({ "i", "s" }, "<Tab>", function()
		if require("luasnip").expand_or_jumpable() then
			require("luasnip").expand_or_jump()
		else
			vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Tab>", true, false, true), "n", true)
		end
	end, { silent = true })

	vim.keymap.set({ "i", "s" }, "<S-Tab>", function()
		if require("luasnip").jumpable(-1) == true then
			require("luasnip").jump(-1)
		else
			vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<S-Tab>", true, false, true), "n", true)
		end
	end, { silent = true })

	ls.filetype_extend("typescriptreact", { "javascriptreact", "javascript", "typescript" })
	ls.filetype_extend("typescript", { "javascriptreact", "javascript", "typescriptreact" })
	ls.filetype_extend("javascriptreact", { "javascript", "typescript", "typescriptreact" })
	ls.filetype_extend("javascript", { "javascript", "typescript", "typescriptreact" })
end
